require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../guest')
require_relative('../song')


class RoomTest < Minitest::Test

  def setup
    @room1 = Room.new("One", 4, 500.00)

    @guest1 = Guest.new("Bob", 10.00, "Iron man")
    @guest2 = Guest.new("Abby", 20.00, "Lonely Boy")
    @guest3 = Guest.new("Gill", 15.00, "Boots are made for walking")
    @guest4 = Guest.new("Gabby", 12.00, "Smells Like Teen Spirit")
    @guest5 = Guest.new("Robert", 8.00, "Toxic")

    @song1 = Song.new("Smells Like Teen Spirit", "Nirvana", "Grunge")
    @song2 = Song.new("Wonderwall", "Oasis", "Alternative")
    @song3 = Song.new("Toxic", "Britney Spears", "Pop")
    @song4 = Song.new("When I'm 64", "Beatles", "Rock")
    @song5 = Song.new("Lonely Boy", "Black Keys", "Indie")
    @song6 = Song.new("Californication", "Red Hot Chili Peppers", "Pop/Rock")

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

  def test_get_number_of_people_in_room__initial
    assert_equal(0, @room1.get_group_number)
  end

  def test_can_add_song_to_room
    room_with_songs = @room1.add_song(@song1)
    assert_equal(1, room_with_songs.length)
  end

  def test_get_number_of_songs_in_playlist__initial
    assert_equal(0, @room1.get_playlist_number)
  end

  def test_get_number_of_songs_in_playlist__full
    room_with_songs = @room1.add_song(@song1)
    room_with_songs = @room1.add_song(@song2)
    room_with_songs = @room1.add_song(@song3)
    assert_equal(3, room_with_songs.length)
  end

  def test_add_whole_playlist_to_room
    room_with_songs = @room1.add_playlist(@playlist)
    assert_equal(6, room_with_songs.length)
  end

  def test_add_song_to_room_name_match
    room_with_songs = @room1.add_song(@song1)
    assert_equal("Smells Like Teen Spirit", room_with_songs[0].name)
  end

  def test_add_song_to_room_genre_match
    room_with_songs = @room1.add_song(@song1)
    assert_equal("Grunge", room_with_songs[0].genre)
  end

  def test_room_begins_empty
    assert_equal(0, @room1.check_empty)
  end

  def test_can_add_guest_to_room__by_number
    room_with_guest = @room1.add_guest(@guest1)
    assert_equal(1, room_with_guest.length)
  end

  def test_can_add_guest_to_room__by_name
    room_with_guest = @room1.add_guest(@guest1.name)
    assert_equal("Bob", room_with_guest[0])
  end

  def test_can_add_group_to_room
    assert_equal(@group1, @room1.add_group(@group1))
  end

  def test_get_group_names
    @room1.add_group(@group1)
    assert_equal(["Bob", "Abby", "Gill"], @room1.group_names)
  end

  def test_guest_can_check_out
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    @room1.checkout(@guest1)
    assert_equal(["Abby"], @room1.group_names)
  end

  def test_guest_can_check_out_from_group
    @room1.add_group(@group1)
    @room1.checkout(@guest2)
    assert_equal(["Bob", "Gill"], @room1.group_names)
  end

  def test_group_can_check_into_room__under_capacity
    assert_equal(true, @room1.capacity_check(@group1))
  end

  def test_group_can_check_into_room__over_capacity
    assert_equal(false, @room1.capacity_check(@group2))
  end

  def test_customer_wallet_decreases_when_entering_room
    @room1.add_guest(@guest2)
    @guest2.entry_fee(5.00)
    assert_equal(15.00, @guest2.wallet)
  end

  def test_get_till
    assert_equal(500.00, @room1.till)
  end

  def test_till_increases_when_customer_buys_room
    @room1.add_guest(@guest2)
    @guest2.entry_fee(5.00)
    @room1.purchase(5.00)
    assert_equal(505.00, @room1.till)
  end

  def test_favourite_song
    @room1.add_playlist(@playlist)
    @room1.add_group(@group1)
    assert_equal("Whooo", @guest4.favourite_song(@song1.name))
    assert_nil(@guest1.favourite_song(@song1.name))
    assert_equal("Whooo", @guest2.favourite_song(@song5.name))
    assert_nil(@guest1.favourite_song(@song5.name))
  end






end
