require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')


class SongTest < Minitest::Test

  def setup
    @song1 = Song.new("Smells Like Teen Spirit", "Nirvana", "Grunge")
    @song2 = Song.new("Back in Black", "AC/DC", "Rock" )
    @song3 = Song.new("Wonderwall", "Oasis", "Alternative")
  end

  def test_get_song_name
    assert_equal("Smells Like Teen Spirit", @song1.name)
  end

  def test_get_song_artist
    assert_equal("Oasis", @song3.artist)
  end

  def test_get_song_genre
    assert_equal("Rock", @song2.genre)
  end

end
