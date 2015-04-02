class Rover

  attr_accessor :x, :y, :direction

  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def read_instruction(inst)
    inst.split("").each do |com|
      if com == "L"
        turn_left
      end
      turn_right if com == "R"
      move if com == "M"
    end
    puts self

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

class NASA
  attr_accessor :rovers, :commands

  def initialize
    @rovers = []
    @commands = []
  end

  def deploy_rover(a, b, c)
    rover = Rover.new(a, b, c)
    @rovers << rover
  end

  def receive(commands)
    @commands << commands
    @rovers.each do |rover|
      rover.read_instruction(@commands[0])
    end
  end

end