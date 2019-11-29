require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../guest')
require_relative('../song')


class RoomTest < Minitest::Test

  def setup
    @room1 = Room.new("One", 4)

    @guest1 = Guest.new("Bob", 10.00)

    @song1 = Song.new("Smells Like Teen Spirit")
  end

  def test_get_room_name
    assert_equal("One", @room1.name)
  end

  def test_get_room_capacity
    assert_equal(4, @room1.capacity)
  end


end
