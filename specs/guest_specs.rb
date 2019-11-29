require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest')
require_relative('../song')

class GuestTest < Minitest::Test

  def setup
    @guest1 = Guest.new("Bob", 10.00)

    @song1 = Song.new("Smells Like Teen Spirit")
  end

  def test_get_guest_name
    assert_equal("Bob", @guest1.name)
  end

  def test_get_guest_wallet
    assert_equal(10.00, @guest1.wallet)
  end

end
