class Utils
  def self.hex_string_to_bin(hex : String) : Pointer(UInt8)
    out = Pointer(UInt8).malloc(hex.size)

    hex.each_char_with_index do |char, index|
      out[index] = char.to_u8(16)
    end

    out
  end
end
