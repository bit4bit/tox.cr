require "./libtox"
require "./utils"

class Tox
  @tox : LibTox::Tox
  @handler : Handler

  # TODO: use macros
  class Options
    @options : LibTox::ToxOptions*

    def local_discovery()
      LibTox.options_get_local_discovery_enabled(@options) != 0
    end
    def local_discovery=(enabled : Bool)
      LibTox.options_set_local_discovery_enabled(@options, 1)
    end

    def hole_punching()
      LibTox.options_get_hole_punching_enabled(@options) != 0
    end
    def hole_punching=(enabled : Bool)
      LibTox.options_set_hole_punching_enabled(@options, 1)
    end

    def initialize()
      @options = LibTox.options_new(out err)
      case err
      when LibTox::ErrOptionsNew::ErrOptionsNewOk
        LibTox.options_default(@options)
      else
        raise Error.new(err)
      end
    end

    def finalize
      LibTox.options_free(@options)
    end

    class Error < Exception
      def initialize(err : LibTox::ErrOptionsNew)
        super("ErrOptions #{err}")
      end
    end
  end

  def self.version()
    major = LibTox.version_major()
    minor = LibTox.version_minor()
    patch = LibTox.version_patch()

    [major, minor, patch]
  end

  def bootstrap(host, port, key : String)
    public_key = Utils.hex_string_to_bin(key)

    LibTox.bootstrap(@tox, host, port, public_key, out err)

    case err
    when LibTox::ErrBootstrap::ErrBootstrapOk
    else
      raise Error.new(err)
    end
  end

  def iterate
    interval = LibTox.iteration_interval(@tox)

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
