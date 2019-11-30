require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../drink')

class DrinkTest < Minitest::Test

  def setup

    @drink1 = Drink.new("Guiness", 4.00)

  end

  def test_drink_has_name
    assert_equal("Guiness", @drink1.drink_name)
  end

  def test_drink_has_price
    assert_equal(4.00, @drink1.price)
  end 

end
