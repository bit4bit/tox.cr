require "./spec_helper"

describe Tox do
  it "version" do
    major, minor, patch = Tox.version()

    major.should be >= 0
    minor.should be >= 2
    patch.should be >= 0
  end

  it "options" do
    options = Tox::Options.new
    options.local_discovery = true
    options.hole_punching = true

    options.local_discovery.should eq(true)
    options.hole_punching.should eq(true)
  end

  it "initialize with default options" do
    options = Tox::Options.new

    Tox.new(options)
  end

  it "bootstrap", tags: "integration" do
    tox = Tox.new

    host = "tox1.mf-net.eu"
    port = 33_445
    public_key = "B3E5FA80DC8EBD1149AD2AB35ED8B85BD546DEDE261CA593234C619249419506"

    tox.bootstrap(host, port, public_key)
  end

  it "iterate", tags: "integration" do
    tox = Tox.new

    tox.iterate
  end

  it "connect to DHT", tags: "integration" do
    events = Channel(Tox::Event).new(10)

    tox = Tox.new(events: events)
    tox.self.name = "bob"
    tox.self.status_message = "bob"

    # requerido de lo contrario no conectan
    tox_peer = Tox.new()
    spawn do
      loop do
        tox_peer.iterate

        tox.iterate
      end
    end

    select
    when event = events.receive
      event.is_a?(Tox::Event::Connection).should eq(true)
    when timeout 15.second
      raise "not event"
    end
  end
end
