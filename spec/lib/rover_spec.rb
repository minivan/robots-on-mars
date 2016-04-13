require 'rover'

describe Rover do
  let(:instructions) { "LMR" }
  let(:orientation)  { :north }

  subject { Rover.new(x: 11, y: 10, orientation: orientation, instructions: instructions) }

  describe "#finished?" do
    context "when there are no more instructions" do
      let(:instructions) { "" }

      it "returns true" do
        expect(subject).to be_finished
      end
    end

    context "when there instructions left" do
      let(:instructions) { "SOMETHING" }

      it "returns false" do
        expect(subject).not_to be_finished
      end
    end
  end

  describe "#to_s" do
    it "returns a properly formatted string" do
      expect(subject.to_s).to eq("11 10 N")
    end
  end

  describe "#process_single" do
    let(:instructions) { "LR" }

    it "executes the instruction" do
      expect(subject).to receive(:turn_left)
      expect(subject).not_to receive(:turn_right)

      subject.process_next
    end

    it "stores the remaining commands dismissing the history" do
      subject.process_next
      expect(subject.instructions).to eq("R")
    end
  end

  describe "#move" do
    context "when the rover is facing north" do
      let(:orientation) { :north }

      it "changes the y coordinate by 1" do
        expect { subject.process_single("M") }.to change { subject.y }.by(1)
      end
    end

    context "when the rover is facing south" do
      let(:orientation) { :south }

      it "changes the y coordinate by -1" do
        expect { subject.process_single("M") }.to change { subject.y }.by(-1)
      end
    end

    context "when the rover is facing west" do
      let(:orientation) { :west }

      it "changes the x coordinate by -1" do
        expect { subject.process_single("M") }.to change { subject.x }.by(-1)
      end
    end

    context "when the rover is facing east" do
      let(:orientation) { :east }

      it "changes the x coordinate by 1" do
        expect { subject.process_single("M") }.to change { subject.x }.by(1)
      end
    end
  end

  describe "#turn_left" do
    before do
      subject.process_single("L")
    end

    context "when the rover is facing north" do
      let(:orientation) { :north }

      it "changes the orientation to west" do
        expect(subject.orientation).to eq(:west)
      end
    end

    context "when the rover is facing west" do
      let(:orientation) { :west }

      it "changes the orientation to south" do
        expect(subject.orientation).to eq(:south)
      end
    end

    context "when the rover is facing south" do
      let(:orientation) { :south }

      it "changes the orientation to east" do
        expect(subject.orientation).to eq(:east)
      end
    end

    context "when the rover is facing east" do
      let(:orientation) { :east }

      it "changes the orientation to north" do
        expect(subject.orientation).to eq(:north)
      end
    end
  end

  describe "#turn_right" do
    before do
      subject.process_single("R")
    end

    context "when the rover is facing south" do
      let(:orientation) { :south }

      it "changes the orientation to west" do
        expect(subject.orientation).to eq(:west)
      end
    end

    context "when the rover is facing west" do
      let(:orientation) { :west }

      it "changes the orientation to north" do
        expect(subject.orientation).to eq(:north)
      end
    end

    context "when the rover is facing north" do
      let(:orientation) { :north }

      it "changes the orientation to east" do
        expect(subject.orientation).to eq(:east)
      end
    end

    context "when the rover is facing east" do
      let(:orientation) { :east }

      it "changes the orientation to south" do
        expect(subject.orientation).to eq(:south)
      end
    end
  end
end
