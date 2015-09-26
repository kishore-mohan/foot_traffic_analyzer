##
# Analyzer handles the data and gives the values after sorting the room index.
module FootTrafficAnalyzer
  class Analyzer < Struct.new(:file)

    attr_accessor :lines

    # result get sorted and prints the result
    def result
      room_wise_result.keys.sort.each do |key|
        p room_wise_result[key]
      end
    end

    private

    # gives room wise result with the average time, visitor count, room name
    def room_wise_result
      results = {}
      assigned_values.group_by{|r| r.room}.each do |k, v|
        results[k.to_i] = Room.new(v).print_data
      end
      results
    end

    #values are assignes like object
    def assigned_values
      inputs = lines.collect do |l|
        AssignValue.new(*l.split)
      end
      inputs
    end

    def log_handler
      @log_handler ||= LogHandler.new(file)
    end

    def lines
      lines = log_handler.get_lines
    end

  end

  #used struct for the clean and object defined 
  class AssignValue < Struct.new(:visitor, :room, :status, :time)
  end

end