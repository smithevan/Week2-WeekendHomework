require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest')
require_relative('../bar')
require_relative('../room')

class BarTest < Minitest::Test

  def setup

    @bar1 = Bar.new("Karao-on-key", 1000.00)

    @room1 = Room.new("One", 4, 500.00)
    @room2 = Room.new("Two", 6, 500.00)
    @room3 = Room.new("Three", 6, 500.00)
    @room4 = Room.new("Four", 4, 500.00)

    @bar_with_four_rooms = [@room1, @room2, @room3, @room4]

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

  def test_bar_has_rooms
    assert_equal(@bar_with_four_rooms, @bar1.add_rooms(@bar_with_four_rooms))
  end

end