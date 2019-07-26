require("minitest/autorun")
require("minitest/rg")
require_relative("../room.rb")
require_relative("../song.rb")


class RoomTest < MiniTest::Test

  def setup()
    @song = Song.new("Simply The Best", "Tina Turner")
    @song2 = Song.new("Bohemian Rhapsody", "Queen")
    @song3 = Song.new("Afscheid", "Volumia!")

    @room = Room.new("Hufflepuff")
    @songs = []
  end

  def test_room_name()
    assert_equal("Hufflepuff", @room.name)
  end

  def test_no_songs()
    assert_equal(0, @songs.count)
  end



end
