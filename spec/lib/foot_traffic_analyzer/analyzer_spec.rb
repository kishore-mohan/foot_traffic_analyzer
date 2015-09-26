require "foot_traffic_analyzer/analyzer"
require "pry"
module FootTrafficAnalyzer
  describe Analyzer do
    let(:file) {"sample1.txt"}
    let(:analyzer) {Analyzer.new(file)}

    describe "result" do
      it "should give reults" do
        expect(analyzer.result).to eq([0])
      end
    end

  end
end