require 'mission'

# NOTE: the squiggly heredoc requires Ruby >= 2.3
# I've extracted them to constants for now

MissionTestInput = <<INPUT
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
INPUT

MissionTestOutput = <<OUTPUT
1 3 N
5 1 E
OUTPUT

describe Mission do
  subject { Mission.new(MissionTestInput) }

  it "can compute the rovers' positions given the inputs" do
    expect(subject.simulate).to eq(MissionTestOutput)
  end

  describe "setting up the plateau" do
    it "extracts the plateau sizes" do
      expect(subject.plateau[:width]).to  eq(5)
      expect(subject.plateau[:height]).to eq(5)
    end
  end

  describe "setting up the rovers" do
    it "correctly computes the rovers count" do
      expect(subject.rovers.size).to eq(2)
    end

    it "correctly assumes the rovers positions" do
      expect(subject.rovers.first.x).to eq(1)
      expect(subject.rovers.first.y).to eq(2)

      expect(subject.rovers.last.x).to  eq(3)
      expect(subject.rovers.last.y).to  eq(3)
    end

    it "correctly computes the orientation" do
      expect(subject.rovers.first.orientation).to eq(:north)
      expect(subject.rovers.last.orientation).to  eq(:east)
    end


    it "correctly extracts the instructions for the rovers" do
      expect(subject.rovers.first.instructions).to eq("LMLMLMLMM")
      expect(subject.rovers.last.instructions).to  eq("MMRMMRMRRM")
    end
  end
end
