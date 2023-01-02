require "./spec_helper"

describe Utils do
  it "bin_to_hex" do
    bin = Pointer(UInt8).malloc(3)
    bin[0] = 3
    bin[1] = 10
    bin[2] = 15

    Utils.bin_to_hex(bin, 3).should eq "3af"
  end

  it "hex_string_to_bin" do
    bin = Utils.hex_to_bin("0123456789ABCDEF")

    bin[0].should eq(0)
    bin[1].should eq(1)
    bin[2].should eq(2)
    bin[3].should eq(3)
    bin[4].should eq(4)
    bin[5].should eq(5)
    bin[6].should eq(6)
    bin[7].should eq(7)
    bin[8].should eq(8)
    bin[9].should eq(9)
    bin[10].should eq(10)
    bin[11].should eq(11)
    bin[12].should eq(12)
    bin[13].should eq(13)
    bin[14].should eq(14)
    bin[15].should eq(15)
  end
end
