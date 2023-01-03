require "./spec_helper"

describe Utils do
  it "bin_to_hex(UInt32)" do
    raw = uninitialized UInt8[4]

    val = 0xAABBCCDD_u32
    IO::ByteFormat::BigEndian.encode(val, raw.to_slice)
    bin = pointerof(raw).as(Pointer(UInt8))

    Utils.bin_to_hex(bin, 4).should eq "aabbccdd"
  end

  it "bin_to_hex" do
    bin = Pointer(UInt8).malloc(2)
    bin[0] = 0xab
    bin[1] = 0xcd

    Utils.bin_to_hex(bin, 2).should eq "abcd"
  end

  it "hex_string_to_bin" do
    bin = Utils.hex_to_bin("0123456789abcdef")

    bin[0].should eq(0x01)
    bin[1].should eq(0x23)
    bin[2].should eq(0x45)
    bin[3].should eq(0x67)
    bin[4].should eq(0x89)
    bin[5].should eq(0xab)
    bin[6].should eq(0xcd)
    bin[7].should eq(0xef)
  end

  it "hex -> bin and bin -> hex" do
    hex = "0123456789abcdef"
    bin = Utils.hex_to_bin(hex)
    Utils.bin_to_hex(bin, 8).should eq(hex)
  end
end
