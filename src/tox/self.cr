
class Tox
  class Self
    @tox : LibTox::Tox

    def address : String
      address = Pointer(UInt8).malloc(LibTox.address_size())

      LibTox.self_get_address(@tox, address)

      Utils.bin_to_hex(address, LibTox.address_size())
    end

    def name=(name : String)
      LibTox.self_set_name(@tox, name, name.size, out err)
      case err
      when LibTox::ErrSetInfo::ErrSetInfoOk
      else
        raise Error.new(err)
      end
    end

    def name : String
      size = LibTox.self_get_name_size(@tox);
      data = Pointer(UInt8).malloc(size)

      LibTox.self_get_name(@tox, data)

      String.build do |str|
        data.to_slice(size).each do |byte|
          str << byte.chr
        end
      end
    end

    def initialize(@tox : LibTox::Tox)
    end
  end

  class Error < Exception
    def initialize(@err : LibTox::ErrSetInfo)
      super("ErrSetInfo #{@err}")
    end
  end
end
