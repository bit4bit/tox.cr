require "./spec_helper"

describe Tox do
  it "notify FriendRequest when add new friend", tags: "integration" do
    events = Channel(Tox::Event).new(10)
    friend_request_events = Channel(Tox::Event).new(10)
    tox = Tox.new()
    friend = Tox.new(events: events)

    tox.add_friend(friend.self.address, "hello")
    spawn do
      loop do
        select
        when event = events.receive
          next unless event.is_a?(Tox::Event::FriendRequest)

          friend_request_events.send event
        when timeout 20.second
          raise "not event"
        else
          friend.iterate()
          tox.iterate()
        end
      end
    end

    select
    when event = friend_request_events.receive
      request = event.to(Tox::Event::FriendRequest)
      request.message.should eq("hello")
    when timeout 15.second
      raise "not event"
    end
  end

  it "add new friend", tags: "integration" do
    events = Channel(Tox::Event).new(10)
    friend_request_events = Channel(Tox::Event).new(10)
    tox = Tox.new()
    friend = Tox.new(events: events)

    tox.add_friend(friend.self.address, "hello")
    spawn do
      loop do
        select
        when event = events.receive
          next unless event.is_a?(Tox::Event::FriendRequest)

          friend_request_events.send event
        when timeout 20.second
          raise "not event"
        else
          friend.iterate()
          tox.iterate()
        end
      end
    end

    select
    when event = friend_request_events.receive
      request = event.to(Tox::Event::FriendRequest)

      # not expect raises
      friend.add_friend_norequest(request.public_key)
    when timeout 15.second
      raise "not event"
    end
  end
end
