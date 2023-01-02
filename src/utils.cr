class Utils
  def self.hex_to_bin(hex : String) : Pointer(UInt8)
    out = Pointer(UInt8).malloc(hex.size)

    hex.each_char_with_index do |char, index|
      out[index] = char.to_u8(16)
    end

    out
  end

  def self.bin_to_hex(bin : Pointer(UInt8), size) : String
    String.build do |str|
      bin.to_slice(size).each do |byte|
        str << byte.to_s(16)
      end
    end
  end
end
