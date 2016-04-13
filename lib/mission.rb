require_relative 'rover'
require_relative 'parsers/rover'
require_relative 'parsers/plateau'

class Mission
  attr_reader :input, :plateau, :rovers

  def initialize(input)
    @input   = input
    @plateau = extract_plateau(input)
    @rovers  = extract_rovers(input)
  end

  def simulate
    ""
  end

  private

  def extract_rovers(input)
    rover_hashes = Parsers::Rovers.new(input).process
    rover_hashes.map { |rover_params| Rover.new(rover_params) }
  end

  def extract_plateau(input)
    Parsers::Plateau.new(input).process
  end
end
