class ShoppingList

  attr_accessor :items, :tax, :total

  def initialize
    @items = []
    @tax = 0
    @total = 0
  end

  def shopping
    answer = add_item
    if answer == "yes"
      answer =  add_item
    elsif answer == "no"
      calculate_tax
      calculate_total
    end
    puts to_s
  end

  def add_item
    item = []
    puts "Please add an item to your shopping list"
    item << gets.chomp
    puts "How many?"
    item << gets.chomp.to_i
    puts "What is the price?"
    item << gets.to_i
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
      puts "#{item[1]} #{item[0]}: #{item[2]}"
    end
    "Sales Taxes: #{@tax}\nTotal: #{@total}"
  end

  def calculate_tax
    @items.each do |item|
      if item[3] == 4
        @tax += item[2]*item[1]*0.15
      elsif item[3] == 1 || item[3] == 2 || item[3] == 3
        @tax += item[2]*item[1]*0.05
      end
    end
  end

  def calculate_total
    @items.each do |item|
      @total += item[2]*item[1]
    end
    @total += @tax
  end

end

shopping_list = ShoppingList.new
shopping_list.shopping