require 'parsers/rover'

RoversTestInput = <<ROVERS_STRING
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
ROVERS_STRING


describe Parsers::Rovers do
  let(:parser) { Parsers::Rovers.new(RoversTestInput) }

  it "correctly extracts the rover data" do
    expect(parser.process).to eq([
      { x: 1, y: 2, orientation: :north, instructions: "LMLMLMLMM"},
      { x: 3, y: 3, orientation: :east,  instructions: "MMRMMRMRRM"}
      ])
  end
end

describe Parsers::Rover do
  let(:parser) { Parsers::Rover.new(["1 2 N", "LMLMLMLMM"]) }

  it "correctly parses the rover data" do
    expect(parser.process).to eq({ x: 1, y: 2, orientation: :north, instructions: "LMLMLMLMM"})
  end
end
