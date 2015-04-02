class Rover

  attr_accessor :x, :y, :direction

  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def read_instruction(inst)
    if inst == "L"
      turn_left
    end
    turn_right if inst == "R"
    move if inst == "M"
  end

  def move
    (@y += 1) if @direction == "N"
    (@y -= 1) if @direction == "S"
    (@x -= 1) if @direction == "W"
    (@x += 1) if @direction == "E"
  end

  def turn_left
    if @direction == "N"
      @direction = "W"
    elsif @direction == "W"
      @direction = "S"
    elsif @direction == "S"
      @direction = "E"
    elsif @direction == "E"
      @direction = "N"
    end
  end

  def turn_right
    @direction = "E" if @direction == "N"
    @direction = "S" if @direction == "E"
    @direction = "W" if @direction == "S"
    @direction = "N" if @direction == "W"
  end

  def to_s
    "I am at (#{@x}, #{@y}) facing: #{@direction}"
  end

end

rover1 = Rover.new(0,0,"N")
puts rover1
rover1.read_instruction("M")
puts rover1
rover1.read_instruction("L")
