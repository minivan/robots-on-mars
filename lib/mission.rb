require_relative 'rover'
require_relative 'parsers/rover'

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
    rover_instructions = input.split("\n")[1..-1]
    rovers = []
    rover_instructions.each_slice(2) do |rover_strings|
      rover_params = Parsers::Rover.new(rover_strings).process
      rovers << Rover.new(rover_params)
    end

    rovers
  end

  def extract_plateau(input)
    plateau_w, plateau_h = parse_plateau_data(input.split("\n").first)
    
    { width: plateau_w, height: plateau_h }
  end

  def parse_plateau_data(plateau_string)
    plateau_data = plateau_string.split(" ").map(&:to_i)

    # if the plateau line will have only one character, assuming a square plateau
    [plateau_data.first, plateau_data.last]
  end
end
