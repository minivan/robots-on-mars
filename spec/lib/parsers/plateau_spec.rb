require 'parsers/plateau'

AllInput = <<PLATEAU_STRING
5 6
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
PLATEAU_STRING

describe Parsers::Plateau do
  let(:parser) { Parsers::Plateau.new(AllInput) }

  it "correctly extracts the plateau data" do
    expect(parser.process).to eq({ width: 5, height: 6 })
  end
end
