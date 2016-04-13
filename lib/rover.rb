class Rover
  attr_reader :x, :y, :orientation, :instructions

  def initialize(params)
    @x, @y = params[:x], params[:y]
    @orientation  = params[:orientation]
    @instructions = params[:instructions]
  end

  def finished?
    @instructions.empty?
  end

  def to_s
    # TODO: unparse the orientation
    "#{x} #{y} #{orientation[0].upcase}"
  end

  def process_next
    return if instructions.empty?
    next_instruction = instructions[0]
    process_single(next_instruction)
    @instructions = instructions[1..-1]
  end

  def process_single(action)
    case action
    when "M" then move
    when "L" then turn_left
    when "R" then turn_right
    else
      fail "Action not implemented"  
    end
  end

  private

  def turn_left
    case orientation
    when :north then @orientation = :west
    when :west  then @orientation = :south
    when :south then @orientation = :east
    when :east  then @orientation = :north
    end
  end

  def turn_right
    case orientation
    when :north then @orientation = :east
    when :east  then @orientation = :south
    when :south then @orientation = :west
    when :west  then @orientation = :north
    end
  end

  def move
    case orientation
    when :north then @y += 1
    when :south then @y -= 1
    when :west  then @x -= 1
    when :east  then @x += 1
    end
  end
end
