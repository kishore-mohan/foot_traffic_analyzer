require "foot_traffic_analyzer/log_handler"

module FootTrafficAnalyzer
  describe LogHandler do 
    let(:file) {"sample1.txt"}
    let(:log_handler) { LogHandler.new(file) }

    describe "initialize" do
      it "should give the log name" do
        expect(log_handler.file).to eq(file)
      end

    end

    describe "get_lines" do
      it "should give 4 lines and total_lines" do
        expect(log_handler.get_lines.size).to eq(4)
        expect(log_handler.total_lines).to eq(4)
      end

      it "should give 0 lines" do
        expect(LogHandler.new("dummy.txt").get_lines.size).to eq(0)
      end
    end

  end
end