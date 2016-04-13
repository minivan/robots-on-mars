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
    until all_finished? do
      rovers.map(&:process_next)
    end

    to_s
  end

  def to_s
    rovers.map(&:to_s).join("\n") + "\n"
  end

  private

  def all_finished?
    rovers.all?(&:finished?)
  end

  def extract_rovers(input)
    rover_hashes = Parsers::Rovers.new(input).process
    rover_hashes.map { |rover_params| Rover.new(rover_params) }
  end

  def extract_plateau(input)
    Parsers::Plateau.new(input).process
  end
end
