class Bar

  attr_reader :drink, :food, :total

  def initialize()
    @drink = 2.50
    @food = 5.00
    @total = 0
  end

  def pay(bar_item)
    @total += bar_item
  end


end
