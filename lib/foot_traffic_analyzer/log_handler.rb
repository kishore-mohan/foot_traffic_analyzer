##
#Log handler will handle the log file and read the each line and assign it into get_lines. 
#Even it gives the total_lines which it read from the log.
module FootTrafficAnalyzer
  class LogHandler

    attr_reader :file, :total_lines

    def initialize(log_file)
      @file = log_file
      @total_lines = 0
    end

    #get the lines and set total_lines
    def get_lines
      lines = []
      read_file.each_line{|l| lines << l.chomp }
      @total_lines = lines.shift.to_i
      lines
    end

    private

    def read_file
      @read_file ||= File.open(file).read
    end

  end
end