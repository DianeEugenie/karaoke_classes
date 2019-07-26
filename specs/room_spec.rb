require("minitest/autorun")
require("minitest/rg")
require_relative("../room.rb")

class RoomTest < MiniTest::Test

  def setup()
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
