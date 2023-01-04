class Tox
  class Event

    class FriendRequest < Event
      getter :public_key
      getter :message

      def initialize(@public_key : String, @message : String)
      end
    end

    class Connection < Event
      getter :status
      enum Status
        None
        Tcp
        Udp
      end

      def self.none() : Connection
        self.new(Status::None)
      end
      def self.tcp() : Connection
        self.new(Status::Tcp)
      end
      def self.udp() : Connection
        self.new(Status::Udp)
      end
      def initialize(@status : Status)
      end
    end

    def to(t : FriendRequest.class) : FriendRequest
      raise "invalid casting to #{t} is #{self.class}" unless is_a?(FriendRequest)

      self.unsafe_as(t)
    end

    def to(t : Connection.class) : Connection
      raise "invalid casting to #{t} is #{self.class}" unless is_a?(Connection)

      self.unsafe_as(t)
    end
  end
end
