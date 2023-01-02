class Tox
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
end
