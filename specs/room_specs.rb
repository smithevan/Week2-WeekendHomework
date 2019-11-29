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
    @guest2 = Guest.new("Abby", 20.00)
    @guest3 = Guest.new("Gill", 15.00)
    @guest4 = Guest.new("Gabby", 12.00)
    @guest5 = Guest.new("Robert", 8.00)

    @song1 = Song.new("Smells Like Teen Spirit")
    @song2 = Song.new("Wonderwall")
    @song3 = Song.new("Toxic")
    @song4 = Song.new("When I'm 64")
    @song5 = Song.new("Rocking in the Free World")
    @song6 = Song.new("Born This Way")

    @group1 = [@guest1, @guest2, @guest3]
    @group2 = [@guest1, @guest2, @guest3, @guest4, @guest5]

    @playlist = [@song1, @song2, @song3, @song4, @song5, @song6]

  end

  def test_get_room_name
    assert_equal("One", @room1.name)
  end

  def test_get_room_capacity
    assert_equal(4, @room1.capacity)
  end

  def test_group_can_check_into_room__under_capacity
    assert_equal(true, @room1.capacity_check(@group1))
  end

  def test_get_number_of_people_in_room__initial
    assert_equal(0, @room1.get_group_number)
  end

  def test_get_number_of_songs_in_playlist__initial
    assert_equal(0, @room1.get_playlist_number)
  end

  def test_can_add_song_to_room
    room_with_song = @room1.add_song(@song1)
    assert_equal(1, room_with_song.length)
  end

  def test_can_add_guest_to_room__by_number
    room_with_guest = @room1.add_guest(@guest1)
    assert_equal(1, room_with_guest.length)
  end

  # def test_can_add_guest_to_room__by_name
  #   room_with_guest = @room1.add_guest(@guest1)
  #   assert_equal("Bob", room_with_guest)
  # end

  def test_group_can_check_into_room__over_capacity
    assert_equal(false, @room1.capacity_check(@group2))
  end







  # def test_room_has_playlist_by_name
  #   playlist = @room1.add_song(@song1)
  #   assert_equal("Smells Like Teen Spirit", playlist.name)
  # end


end
