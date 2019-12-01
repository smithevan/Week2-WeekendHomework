require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest')
require_relative('../bar')
require_relative('../room')
require_relative('../drink')

class BarTest < Minitest::Test

  def setup

    @bar1 = Bar.new("Karao-on-key", 1000.00)

    @room1 = Room.new("One", 4, 500.00)
    @room2 = Room.new("Two", 6, 500.00)
    @room3 = Room.new("Three", 6, 500.00)
    @room4 = Room.new("Four", 4, 500.00)

    @bar_with_four_rooms = [@room1, @room2, @room3, @room4]

    @drink1 = Drink.new("Guiness", 4.00)
    @drink2 = Drink.new("Wine", 4.50)
    @drink3 = Drink.new("Lager", 2.50)
    @drink4 = Drink.new("Rum", 3.00)
    @drink5 = Drink.new("Juice", 2.00)

    @bar_with_drinks = [@drink1, @drink2, @drink3, @drink4, @drink5]

    @guest1 = Guest.new("Bob", 10.00, "Back in Black")
    @guest2 = Guest.new("Abby", 20.00, "Lonely Boy")
    @guest3 = Guest.new("Gill", 15.00, "Boots are made for walking")

  end

  def test_bar_has_bar_name
    assert_equal("Karao-on-key", @bar1.bar_name)
  end

  def test_bar_has_till
    assert_equal(1000.00, @bar1.bar_till)
  end

  def test_number_of_rooms_in_bar
    assert_equal(0, @bar1.rooms_in_bar)
  end

  def test_bar_has_rooms
    @bar1.add_rooms(@room1)
    @bar1.add_rooms(@room2)
    @bar1.add_rooms(@room3)
    @bar1.add_rooms(@room4)
    assert_equal(@bar_with_four_rooms.length, @bar1.rooms_in_bar)
  end

  def test_bar_has_drinks__test_name_single_drink
    assert_equal(["Guiness"], @bar1.add_drink(@drink1.drink_name))
  end

  def test_bar_has_drinks__test_name_mulitple_drinks
    @bar1.add_drink(@drink1)
    @bar1.add_drink(@drink2)
    @bar1.add_drink(@drink3)
    @bar1.add_drink(@drink4)
    @bar1.add_drink(@drink5)
    assert_equal(@bar_with_drinks, @bar1.get_drinks)
  end

  def test_drink_can_be_removed
    @bar1.add_drink(@drink1)
    @bar1.add_drink(@drink2)
    assert_equal([@drink1], @bar1.remove_drink(@drink2))
  end

  def test_drink_count
    @bar1.add_drink(@drink1)
    @bar1.add_drink(@drink2)
    assert_equal(2, @bar1.drink_count)
  end

  def test_guest_can_take_drink
    @bar1.add_drink(@drink1)
    @bar1.add_drink(@drink2)
    @bar1.add_drink(@drink3)
    @guest1.take_drink(@drink1)
    @bar1.remove_drink(@drink1)
    assert_equal(2, @bar1.drink_count)
  end

  def test_buying_drink_removes_customer_money
    @bar1.add_drink(@drink1)
    @guest1.take_drink(@drink1)
    @bar1.remove_drink(@drink1)
    @guest1.drink_charge(nil, @drink1.price)
    assert_equal(6.00, @guest1.wallet)
  end

  def test_buying_drink_increases_bar_till
    @bar1.add_drink(@drink1)
    @guest1.take_drink(@drink1)
    @bar1.remove_drink(@drink1)
    @guest1.drink_charge(nil, @drink1.price)
    @bar1.make_sale(@drink1.price)
    assert_equal(1004.00, @bar1.bar_till)
  end

  def test_bar_can_run_a_tab_under_customer_name_and_complete_sale_later
    @bar1.add_drink(@drink1)
    @bar1.add_drink(@drink2)
    @bar1.add_drink(@drink3)
    assert_equal(true, @guest1.can_afford_drink(@drink1.price))
    @bar1.remove_drink(@drink1)
    @guest1.take_drink(@drink1)
    @bar1.run_tab(@guest1.name, @drink1.price)
    assert_equal(true, @guest1.can_afford_drink(@drink2.price))
    @bar1.remove_drink(@drink2)
    @guest1.take_drink(@drink2)
    @bar1.add_to_tab(@guest1.name, @drink2.price)
    @guest1.drink_charge(@bar1.tab[:name], @bar1.tab[:tab])
    @bar1.make_sale(@bar1.tab[:tab])
    assert_equal(1, @bar1.drink_count)
    assert_equal(1.50, @guest1.wallet)
    assert_equal(1008.50, @bar1.bar_till)
  end


end
