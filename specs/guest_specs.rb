require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest')
require_relative('../song')

class GuestTest < Minitest::Test

  def setup
    @song1 = Song.new("Smells Like Teen Spirit")
  end

end
