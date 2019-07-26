require("minitest/autorun")
require("minitest/rg")
require_relative("../bar.rb")

class BarTest < MiniTest::Test

  def setup()

    @drink = 2.50
    @food = 5.00
    
    @bar = Bar.new()
  end

  def test_drink_price()
    assert_equal(2.50, @bar.drink)
  end

  def test_food_price()
    assert_equal(5.00, @bar.food)
  end

  def test_add_to_total()
    @bar.pay(@food)
    assert_equal(5.00, @bar.total)
  end
end
