require("minitest/autorun")
require("minitest/rg")
require_relative("../guest.rb")

class GuestTest < MiniTest::Test

  def setup()

    @guest = Guest.new("Thekla", "Hotline Bling")

  end

  def test_guest_name()
    assert_equal("Thekla", @guest.name)
  end

  def test_fav_song_name()
    assert_equal("Hotline Bling", @guest.fav_song)
  end


end
