require "./libtox"
require "./utils"
require "./tox/options"
require "./tox/self"

class Tox
  @tox : LibTox::Tox
  @handler : Handler
  @self : Self

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

  def iterate(interval : Int? = nil)
    interval ||= LibTox.iteration_interval(@tox)

    LibTox.iterate(@tox, pointerof(@handler))

    sleep interval.millisecond
  end

  class Handler
  end

  class DummyHandler < Handler
  end

  def initialize(options : Options? = nil, handler : Handler = DummyHandler.new)
    @handler = handler

    @tox = LibTox.new(nil, out err)
    case err
    when LibTox::ErrNew::ErrNewOk
      @self = Self.new(@tox)
    else
      raise Error.new(err)
    end
  end

  def finalize
    LibTox.kill(@tox)
  end

  class Error < Exception
    def initialize(@err : LibTox::ErrNew | LibTox::ErrBootstrap)
      super("NewError #{@err}")
    end
  end
end
