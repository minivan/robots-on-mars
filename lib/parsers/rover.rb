module Parsers
  class Rovers
    def initialize(input)
      @input = input
    end

    def process
      rover_instructions = @input.split("\n")[1..-1]
      rovers = []
      rover_instructions.each_slice(2) do |rover_strings|
        rover_params = Parsers::Rover.new(rover_strings).process
        rovers << rover_params
      end

      rovers
    end
  end

  class Rover
    def initialize(rover_strings)
      # an array of two strings
      # ["1 2 N", "LMLMLMLMM"]
      @input = rover_strings
    end

    def process
      x, y         = extract_position(@input.first)
      orientation  = extract_orientation(@input.first)
      instructions = @input.last
      { x: x, y: y, orientation: orientation, instructions: instructions }
    end

    private

    def extract_orientation(position_string)
      # a string in the form of "1 2 N". We need to get :north.
      positions = position_string.split(" ")
      orientation_string = positions.last

      case orientation_string
      when "N" then :north
      when "E" then :east
      when "S" then :south
      when "W" then :west
      else 
        fail "Invalid orientation string"
      end
    end

    def extract_position(position_string)
      # a string in the form of "1 2 N". We need the first two digits
      positions = position_string.split(" ")
      positions[0..1].map(&:to_i)
    end
  end
end
