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
end
