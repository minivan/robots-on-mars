class Mission
  attr_reader :input, :plateau

  def initialize(input)
    @input = input
    plateau_width, plateau_height = parse_plateau_data(input.split("\n").first)
    @plateau = { width: plateau_width, height: plateau_height }
  end

  def simulate
    ""
  end

  private

  def read_plateau_data
    plateau_data = input.split("\n").first
  end

  def parse_plateau_data(plateau_string)
    plateau_data = plateau_string.split(" ").map(&:to_i)

    # if the plateau line will have only one character, assuming a square plateau
    [plateau_data.first, plateau_data.last]
  end
end
