require("minitest/autorun")
require("minitest/rg")
require_relative("../room.rb")
require_relative("../song.rb")
require_relative("../guest.rb")
require_relative("../bar.rb")

class RoomTest < MiniTest::Test

  def setup()
    @song = Song.new("Simply The Best", "Tina Turner")
    @song2 = Song.new("Bohemian Rhapsody", "Queen")
    @song3 = Song.new("Afscheid", "Volumia!")

    @guest = Guest.new("Thekla", @song3, 20.00)
    @guest2 = Guest.new("Diane", @song2, 25.00)
    @guest3 = Guest.new("Martin", @song, 40.00)

    @room = Room.new("Hufflepuff", 2)

    @drink = 2.50
    @food = 5.00

    @bar = Bar.new()

  end

  def test_room_name()
    assert_equal("Hufflepuff", @room.name)
  end

  def test_songs_in_playlist()
    assert_equal(0, @room.song_count)
  end

  def test_room_is_empty()
    assert_equal(0, @room.guest_count)
  end

  def test_check_in_guests()
    #Act
    @room.check_in(@guest)
    #Assert
    assert_equal(1, @room.guest_count)
  end

  def test_check_out_guests()
    #Arrange
    @room.check_in(@guest)
    @room.check_in(@guest2)
    #Act
    @room.check_out(@guest)
    #Assert
    assert_equal(1, @room.guest_count)
  end

  def test_add_song_to_playlist()
    #Act
    @room.add_song(@song)
    #Assert
    assert_equal(1, @room.song_count)
  end

  def test_room_capacity()
    assert_equal(2, @room.capacity)
  end

  def test_room_is_full()
    #Arrange
    @room.check_in(@guest)
    @room.check_in(@guest2)
    #Act
    @room.is_full?()
    #Assert
    assert_equal(2, @room.guest_count)
    assert_equal(true, @room.is_full?)
  end

  def test_full_room_cannot_add_guests()
    #Arrange
    @room.check_in(@guest)
    @room.check_in(@guest2)
    #Act
    @room.check_in(@guest3)
    #Assert
    assert_equal(2, @room.guest_count)
    assert_equal(13.00, @room.bill)
  end

  def test_room_has_entry_fee()
    assert_equal(6.50, @room.entry_fee)
  end

  def test_guest_entry_fee_added_to_till()
    #Arrange
    @room.check_in(@guest)
    #Assert
    assert_equal(6.50, @room.bill)
    assert_equal(13.50, @guest.wallet)
  end

  def test_guest_check_song_on_playlist__true()
    #Arrange
    @room.check_in(@guest3)
    @room.add_song(@song)
    #Act
    result = @room.check_playlist(@guest3)
    #Assert
    assert_equal("That's MY JAM!", result)
  end

  def test_guest_check_song_on_playlist__false()
    #Arrange
    @room.check_in(@guest2)
    @room.add_song(@song)
    #Act
    result = @room.check_playlist(@guest2)
    #Assert
    assert_equal("Awh.. #{@guest2.fav_song.name} is not on the playlist!", result)
  end

  def test_add_bar_total_to_bill()
    result = @bar.pay(@food)
    @room.add_to_bill(result)
    assert_equal(5.00, @bar.total)
    assert_equal(5.00, @room.bill)
  end

  def test_add_bar_total_to_bill_and_one_guest()
    @room.check_in(@guest2)
    result = @bar.pay(@food)
    @room.add_to_bill(result)
    assert_equal(5.00, @bar.total)
    assert_equal(11.50, @room.bill) #5.00 for food + 6.50 for entryfee
  end



end
