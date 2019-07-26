require("minitest/autorun")
require("minitest/rg")
require_relative("../song.rb")

class SongTest < MiniTest::Test

  def setup()

    @song = Song.new("Simply The Best", "Tina Turner")

  end

  def test_song_name()
    assert_equal("Simply The Best", @song.name)
  end

  def test_singer_name()
    assert_equal("Tina Turner", @song.singer)
  end


end
