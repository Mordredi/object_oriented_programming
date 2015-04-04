class Rover

  attr_accessor :x, :y, :direction, :b_x, :b_y

  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
    @b_x = 0
    @b_y = 0
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

  attr_accessor :rovers, :plateau

  def initialize
    @rovers = []
    @plateaus = []
  end

  def menu
    puts "Hello NASA, please select command by number"
    puts "[1] Set plateau size"
    puts "[2] Deploy rover"
    puts "[3] Issue rover commands"
    puts "[4] Plateau size"
    puts "[5] Exit"
    puts "Select:"
    command = gets.to_i
    set_plateau if command == 1
    deploy_rover if command == 2
    receive if command == 3
    plateau_size if command == 4
    exit if command == 5
  end

  def deploy_rover
    puts "Set point of deployment"
    puts "x:"
    x = gets.to_i
    puts "y:"
    y = gets.to_i
    puts "Facing which direction? [N, W, S, E]"
    direction = gets.chomp.upcase
    rover = Rover.new(x, y, direction)
    @rovers << rover
    menu
  end

  def receive
    @rovers.each do |rover|
      puts "Please issue commands"
      commands = gets
      rover.read_instruction(commands)
    end
    menu
  end

  def set_plateau
    puts "Please declare size of plateau."
    puts "x:"
    x = gets.to_i
    puts "y:"
    y = gets.to_i
    puts "Plateau size received."
    plateau = Plateau.new(x, y)
    @plateaus << plateau
    menu
  end

  def plateau_size
    @plateaus.each do |plateau|
     puts plateau
    end
    menu
  end
end

class Plateau

  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def to_s
    "The plateau is #{@x} wide and #{@y} tall."
  end

end

nasa = NASA.new

nasa.menu