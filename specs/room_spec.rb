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

  end

  def test_room_name()
    assert_equal("Hufflepuff", @room.name)
  end

  def test_songs_in_playlist()
    assert_equal(0, @room.song_count)
  end

  def test_add_song_to_playlist()
    #Act
    @room.add_song(@song)
    #Assert
    assert_equal(1, @room.song_count)
  end



end
