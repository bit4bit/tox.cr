require "./spec_helper"

describe Tox do
  it "notify FriendRequest when add new friend", tags: "integration" do
    events = Channel(Tox::Event).new(10)
    consumer = Tox::EventConsumer.new(events, 10, events: [Tox::Event::FriendRequest])
    tox = Tox.new()
    friend = Tox.new(events: events)

    tox.add_friend(friend.self.address, "hello")
    spawn do
      loop do
        friend.iterate()
        tox.iterate()
      end
    end

    select
    when event = consumer.consume(Tox::Event::FriendRequest).receive
      event.message.should eq("hello")
    when timeout 15.second
      raise "not event"
    end
  end

  it "add new friend", tags: "integration" do
    events = Channel(Tox::Event).new(10)
    consumer = Tox::EventConsumer.new(events, 10, events: [Tox::Event::FriendRequest])
    tox = Tox.new()
    friend = Tox.new(events: events)

    tox.add_friend(friend.self.address, "hello")
    spawn do
      loop do
        friend.iterate()
        tox.iterate()
      end
    end

    select
    when event = consumer.consume(Tox::Event::FriendRequest).receive
      # not expect raises
      friend.add_friend_norequest(event.public_key)
    when timeout 15.second
      raise "not event"
    end
  end
end
