require "./spec_helper"

describe Tox::Self do
  it "self.address" do
    tox = Tox.new

    tox.self.address.size.should eq(LibTox.address_size() * 2)
  end

  it "self.contact_address" do
    tox = Tox.new

    tox.self.contact_address.size.should eq(tox.self.address.size + 8)
  end

  it "self.name=" do
    tox = Tox.new

    tox.self.name = "toxto"

    tox.self.name.should eq("toxto")
  end

  it "self.nospam" do
    tox = Tox.new

    tox.self.nospam = 0x12345678

    tox.self.nospam.should eq(0x12345678)
  end
end
