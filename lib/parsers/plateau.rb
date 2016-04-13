module Parsers
  class Plateau
    def initialize(input)
      @input = input
    end

    def process
      plateau_w, plateau_h = @input.split("\n").
                                    first.
                                    split(" ").
                                    map(&:to_i)
      { width: plateau_w, height: plateau_h }
    end
  end
end
