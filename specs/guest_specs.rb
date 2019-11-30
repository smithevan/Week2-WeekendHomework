require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest')
require_relative('../song')
require_relative('../drink')

class GuestTest < Minitest::Test

  def setup
    @guest1 = Guest.new("Bob", 10.00, "Smells Like Teen Spirit")
    @guest2 = Guest.new("Peter", 50.00, "Seven Nation Army")

    @song1 = Song.new("Smells Like Teen Spirit", "Nirvana", "Grunge")

    @drink1 = Drink.new("Guiness", 4.00)
  end

  def test_get_guest_name
    assert_equal("Bob", @guest1.name)
  end

  def test_get_guest_wallet
    assert_equal(10.00, @guest1.wallet)
  end

  def test_wallet_can_decrease
    @guest1.entry_fee(5.00)
    assert_equal(5.00, @guest1.wallet)
  end

  def test_guest_has_favourite_song
    assert_equal("Whooo", @guest1.favourite_song(@song1.name))
    assert_nil(@guest2.favourite_song(@song1.name))
  end

  def test_guest_can_take_drink
    assert_equal(["Guiness"], @guest1.take_drink(@drink1.drink_name))
  end
end
