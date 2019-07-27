class BarTab

  attr_reader :drink_price, :food_price, :total

  def initialize(drink_price, food_price)
    @drink_price = drink_price
    @food_price = food_price
    @total = 0
    @max_spend = 0
  end

  def pay(bar_item)
    @total += bar_item
  end

  def max_spend(amount)
    @max_spend += amount
  end


end
