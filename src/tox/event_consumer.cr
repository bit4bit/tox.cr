class Tox
  class EventConsumer
    def initialize(@poll : Channel(Event), capacity, events  = [] of Event)
      @distributor = Hash(Event.class, Channel(Event)).new()
      events.each do |kind|
        @distributor[kind] = Channel(Event).new(capacity)
      end

      spawn name: "event-consumer" do
        loop do
          event = @poll.receive
          channel = @distributor.fetch(event.class, nil)
          unless channel.nil?
            channel.not_nil!.send event
          end
        end
      end
    end

    def consume(kind : Event::FriendRequest.class) : Channel(Event::FriendRequest)
      wait = Channel(Event::FriendRequest).new(1)
      wait.send @distributor.fetch(kind, nil).not_nil!.receive.to(Event::FriendRequest)
      wait
    end

    def consume(kind : Event::Connection.class) : Channel(Event::Connection)
      wait = Channel(Event::Connection).new(1)
      wait.send @distributor.fetch(kind, nil).not_nil!.receive.to(Event::Connection)
      wait
    end
  end
end
