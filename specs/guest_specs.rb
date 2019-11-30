require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest')
require_relative('../song')

class GuestTest < Minitest::Test

  def setup
    @guest1 = Guest.new("Bob", 10.00)

    @song1 = Song.new("Smells Like Teen Spirit", "Nirvana", "Grunge")
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

end
