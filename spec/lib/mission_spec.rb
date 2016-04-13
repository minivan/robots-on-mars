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
  let(:input) {
    @input
  }

  let(:output) {
    @output
  }

  it "can compute the rovers' positions given the inputs" do
    expect(subject.process(MissionTestInput)).to eq(MissionTestOutput)
  end
end
