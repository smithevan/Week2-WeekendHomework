require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')


class SongTest < Minitest::Test

  def setup
    @song1 = Song.new("Smells Like Teen Spirit")
    @song2 = Song.new("Toxic")
    @song3 = Song.new("Wonderwall")
  end

  def test_get_song_name
    assert_equal("Smells Like Teen Spirit", @song1.name)
  end

end
