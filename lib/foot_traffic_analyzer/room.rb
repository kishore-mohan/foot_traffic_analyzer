module FootTrafficAnalyzer
  class Room
    attr_accessor :room
    def initialize(room)
      @room = room
    end  

    def print_data
      "Room #{name}, #{average_time} minute average visit, #{total_visitors} visitor" + (total_visitors > 1 ? 's total' : ' total')      
    end

    private

    def name
      room.first.room
    end

    #calculating total time for the room
    def total_time_per_room
      leaving, entering = 0,0
      room.each do |r|
        entering += r.time.to_i if r.status == "I"
        leaving += r.time.to_i if r.status == "O"
      end
      (leaving - entering).to_i
    end

    #calculating averate time for the room
    def average_time
      (total_time_per_room/ total_visitors).to_i
    end

    #calulating total visitor for the room
    def total_visitors
      room.group_by{|v| v.visitor}.count.to_i
    end

  end
end