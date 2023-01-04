require "./libtox"
require "./utils"
require "./tox/options"
require "./tox/self"
require "./tox/event"
require "./tox/event_consumer"

class Tox
  @tox : LibTox::Tox
  @self : Self
  @box : Pointer(Void)?

  getter :self

  def self.version()
    major = LibTox.version_major()
    minor = LibTox.version_minor()
    patch = LibTox.version_patch()

    [major, minor, patch]
  end

  def bootstrap(host, port, key : String)
    public_key = Utils.hex_to_bin(key)

    LibTox.bootstrap(@tox, host, port, public_key, out err)

    case err
    when LibTox::ErrBootstrap::ErrBootstrapOk
    else
      raise Error.new(err)
    end
  end

  def start_timer
    iterator = Channel(Nil).new(1)
    spawn do
      loop do
        iterator.send nil
        sleep iteration_interval.millisecond
      end
    end

    iterator
  end

  def iterate()
    boxed = Box.box(self)
    LibTox.iterate(@tox, boxed)
    sleep iteration_interval.millisecond
  end

  def add_friend(toxid : String, message : String = "") : UInt32
    address = Utils.hex_to_bin(toxid)

    friend_id = LibTox.friend_add(@tox, address, message, message.size, out err)

    case err
    when LibTox::ErrFriendAdd::ErrFriendAddOk
      friend_id
    else
      raise Error.new(err)
    end
  end

  def add_friend_norequest(public_key : String) : UInt32
    address = Utils.hex_to_bin(public_key)

    friend_id = LibTox.friend_add_norequest(@tox, address, out err)

    case err
    when LibTox::ErrFriendAdd::ErrFriendAddOk
      friend_id
    else
      raise Error.new(err)
    end
  end

  def handle_friend_request(public_key, message)
    return if @events.nil?
    ch = @events.as(Channel(Tox::Event))
    ch.send Event::FriendRequest.new(public_key, message)
  end

  def handle_self_connection_status(status)
    if @events.nil?
      return
    else
      ch = @events.as(Channel(Tox::Event))
      ev = case status
           when LibTox::Connection::ConnectionNone
             Event::Connection.new(:none)
           when LibTox::Connection::ConnectionTcp
             Event::Connection.new(:tcp)
           when LibTox::Connection::ConnectionUdp
             Event::Connection.new(:udp)
           else
             raise "not known how handle connection status #{status}"
           end

      ch.send ev
    end
  end

  def initialize(options : Options? = nil, @events : Channel(Event)? = nil)
    @tox = LibTox.new(options, out err)

    case err
    when LibTox::ErrNew::ErrNewOk
      @self = Self.new(@tox)
      @box = Box.box(self)
      LibTox.callback_friend_request(@tox, ->(_tox, public_key, message, message_length, user_data) {
                                       wtox = Box(Tox).unbox(user_data)
                                       public_key_hex = Utils.bin_to_hex(public_key, LibTox::PUBLIC_KEY_SIZE)
                                       message_str = Utils.bin_to_string(message, message_length)
                                       wtox.handle_friend_request(public_key_hex, message_str)
                                     })

      LibTox.callback_self_connection_status(@tox, ->(_tox, status, user_data) {
                                               wtox = Box(Tox).unbox(user_data)
                                               wtox.handle_self_connection_status(status)
                                             })
    else
      raise Error.new(err)
    end
  end

  def finalize
    LibTox.kill(@tox)
  end

  class Error < Exception
    def initialize(@err : LibTox::ErrNew | LibTox::ErrBootstrap | LibTox::ErrFriendAdd)
      super("NewError #{@err}")
    end
  end

  private def iteration_interval
    LibTox.iteration_interval(@tox)
  end
end
