require("minitest/autorun")
require("minitest/rg")
require_relative("../bar.rb")

class BarTabTest < MiniTest::Test

  def setup()

    @drink = 2.50
    @food = 5.00

    @bar_tab = BarTab.new()
  end

  def test_drink_price()
    assert_equal(2.50, @bar_tab.drink)
  end

  def test_food_price()
    assert_equal(5.00, @bar_tab.food)
  end

  def test_add_to_total()
    @bar_tab.pay(@food)
    assert_equal(5.00, @bar_tab.total)
  end
end
