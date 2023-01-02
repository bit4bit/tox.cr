require "./spec_helper"

describe Tox::Self do
  it "self.address" do
    tox = Tox.new

    tox.self.address.size.should be >= 16
  end

  it "self.name=" do
    tox = Tox.new

    tox.self.name = "toxto"

    tox.self.name.should eq("toxto")
  end
end
