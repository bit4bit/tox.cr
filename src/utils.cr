class Utils
  def self.bin_to_string(bin : Pointer(UInt8), size) : String
    String.build do |str|
      bin.to_slice(size).each do |byte|
        str << byte.chr
      end
    end
  end

  def self.hex_to_bin(hex : String) : Pointer(UInt8)
    out = Pointer(UInt8).malloc(hex.size)

    pair = ""
    hex.each_char_with_index do |char, index|
      pair += char

      if index == 1
        out[index - 1] = pair.to_u8(16)
        pair = ""
      elsif (index + 1) % 2 == 0
        out[(index / 2).to_i] = pair.to_u8(16)
        pair = ""
      end
    end

    out
  end

  def self.bin_to_hex(bin : Pointer(UInt8), size) : String
    raise "invalid size" unless size % 2 == 0
    String.build do |str|
      bin.to_slice(size).each do |byte|
        if byte <= 0xf
          str << "0"
        end
        str << byte.to_s(16)
      end
    end
  end
end
