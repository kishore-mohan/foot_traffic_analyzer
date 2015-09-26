require "foot_traffic_analyzer/analyzer"
require "foot_traffic_analyzer/room"

module FootTrafficAnalyzer
  describe Room do 
    let(:dummydata) { [AssignValue.new("1", "0", "I", "540"), AssignValue.new("1", "0", "O", "560")] }
    let(:room) {Room.new(dummydata)}
    describe "initialize" do      

      it "should give room count 2" do
        expect(room.room.size).to eq(2)
      end

      it "should give room time value" do
        expect(room.room.first.time).to eq("540")
      end

      it "should give room name" do
        expect(room.send(:name)).to eq("0")
      end
    end

    describe "print result" do
      it "should print the result" do
        expect(room.print_data).to eq("Room 0, 20 minute average visit, 1 visitor total")
      end

      it "should print the result with visitors" do
        visitors = [AssignValue.new("1", "0", "I", "540"), AssignValue.new("1", "0", "O", "560"), 
          AssignValue.new("2", "0", "I", "540"), AssignValue.new("2", "0", "O", "560")]
        room = Room.new(visitors)
        expect(room.print_data).to eq("Room 0, 20 minute average visit, 2 visitors total")
      end

      it "should give round of value" do
        float_value = [AssignValue.new("2", "32", "I", "408"), AssignValue.new("2", "32", "O", "495")]
        room = Room.new(float_value)
        expect(room.print_data).to eq("Room 32, 87 minute average visit, 1 visitor total")
      end
    end


  end
end