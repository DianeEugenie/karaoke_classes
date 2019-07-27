require("minitest/autorun")
require("minitest/rg")
require_relative("../bar.rb")

class BarTabTest < MiniTest::Test

  def setup()
    @bar_tab = BarTab.new(2.50, 5.00)
  end

  def test_drink_price()
    assert_equal(2.50, @bar_tab.drink_price)
  end

  def test_food_price()
    assert_equal(5.00, @bar_tab.food_price)
  end

  def test_add_to_total()
    @bar_tab.pay(5.00)
    assert_equal(5.00, @bar_tab.total)
  end

  def test_set_max_spend()
    result = @bar_tab.max_spend(40)
    assert_equal(40, result)
  end

end
