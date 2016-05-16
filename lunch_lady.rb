class Buyer
  attr_accessor :dishes, :wallet

  def initialize
    @dishes = []
    @wallet = 7.00
  end

end

class Dish
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

end

class LunchLady
  attr_accessor :buyer

  def initialize
    @buyer = Buyer.new
  end

  def pick_main_dish
    puts "What main dish would you like?
      1: Meatloaf(5.00)
      2: Mystery Meat(3.00)
      3: Slop(1.00)"

    case gets.strip
      when '1'
        buyer.dishes << Dish.new("Meatloaf", 5.00)
      when '2'
        buyer.dishes << Dish.new("Mystery Meat", 3.00)
      when '3'
        buyer.dishes << Dish.new("Slop", 1.00)
      else
        puts "Bad selection choose 1-3"
        pick_main_dish
    end
  end

  def pick_side_dish
    #TODO Refactor side dish and main dish to 1 method
    puts "What side dish would you like?
      1: Rice Salad Soup(1.75)
      2: Mystery Yogurt(1.00)
      3: Beef Jerkey(.50)"
    case gets.strip
      when '1'
        buyer.dishes << Dish.new('Rice Salad Soup', 1.75)
      when '2'
        buyer.dishes << Dish.new('Mystery Yogurt', 1.00)
      when '3'
        buyer.dishes << Dish.new('Beef Jerkey', 0.50)
      else
        puts "Bad selection choose 1-3"
        pick_side_dish
    end
  end

  def repeat_order
    puts "Your order consists of:"
    puts buyer.dishes.map(&:name).join(', ')
  end

  def total_order
    puts "Your order total is:"
    puts buyer.dishes.map(&:price).inject(:+)
  end

  def process_buyer
    pick_main_dish
    2.times { pick_side_dish }
    repeat_order
    total_order
  end

end

LunchLady.new.process_buyer
