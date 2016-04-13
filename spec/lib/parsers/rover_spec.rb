require 'parsers/rover'

describe Parsers::Rover do
  let(:parser) { Parsers::Rover.new(["1 2 N", "LMLMLMLMM"]) }

  it "correctly parses the rover data" do
    expect(parser.process).to eq({ x: 1, y: 2, orientation: :north, instructions: "LMLMLMLMM"})
  end
end
