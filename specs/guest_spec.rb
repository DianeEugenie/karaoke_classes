require("minitest/autorun")
require("minitest/rg")
require_relative("../guest.rb")
require_relative("../song.rb")

class GuestTest < MiniTest::Test

  def setup()

    @fav_song = Song.new("Hotline Bling", "Drake" )
    @guest = Guest.new("Thekla", @fav_song)

  end

  def test_guest_name()
    assert_equal("Thekla", @guest.name)
  end

  def test_fav_song_name()
    assert_equal("Hotline Bling", @fav_song.name)
  end


end
