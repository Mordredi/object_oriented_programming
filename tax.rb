class ShoppingList

  attr_accessor :items

  def initialize
    @items = []
  end

  def shopping
    answer = add_item
    if answer == "yes"
      answer =  add_item
    elsif answer == "no"
      calculate
    end
  end

  def add_item
    item = []
    puts "Please add an item to your shopping list"
    item << gets.chomp
    puts "How many?"
    item << gets.chomp
    puts "What is the price?"
    item << gets.chomp.to_i
    puts "Please select type of item by number"
    puts "[1] food"
    puts "[2] book"
    puts "[3] medical"
    puts "[4] other"
    item << gets.chomp.to_i
    @items << item
    puts "Would you like to add another item? Yes, or no"
    gets.chomp.downcase
  end

  def to_s
    @items.each do |item|
      "#{item[1]} #{item[0]}: #{item[2]}"
    end
  end

  def calculate
  end

end


