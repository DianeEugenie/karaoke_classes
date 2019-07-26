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
    @guest4 = Guest.new("Lala", @song2, 5.00)

    @room = Room.new("Hufflepuff", 2)

    @drink = 2.50
    @food = 5.00

    @bar = BarTab.new()

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

  def test_check_in_guests__guest_poor()
    #Act
    result = @room.check_in(@guest4)
    #Assert
    assert_equal(0, @room.guest_count)
    assert_equal("The entry fee is 6.50.", result)
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
    assert_equal("OMG! They have Simply The Best. That's MY JAM!", result)
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
    #Arrange
    result = @bar.pay(@food)
    #Act
    @room.add_to_bill(result)
    #Assert
    assert_equal(5.00, @bar.total)
    assert_equal(5.00, @room.bill)
  end

  def test_add_bar_total_to_bill_and_one_guest()
    #Arrange
    @room.check_in(@guest2) #6.50 for entry_fee
    result = @bar.pay(@food) #5.00 for food
    #Act
    @room.add_to_bill(result)
    #Assert
    assert_equal(5.00, @bar.total)
    assert_equal(11.50, @room.bill) #5.00 + 6.50
  end

  def test_check_total_money_of_customers()
    #Arrage - add customers cost = 13
    @room.check_in(@guest)
    @room.check_in(@guest2)
    #Act
    result = @room.check_money()
    #Assert (45 - 13 = 32)
    assert_equal(32.00, result)
  end

  # def test_total_bill_reached()
  #   #Arrange
  #   @room.check_in(@guest)
  #   @room.check_in(@guest2) #13 in total
  #   @bar.pay(@food)
  #   @bar.pay(@food)
  #   @bar.pay(@food)
  #   @bar.pay(@food)
  #   @bar.pay(@food)
  #   @bar.pay(@food) #40 in total
  #   @bar.pay(@drink)  #45.5
  #   @room.add_to_bill(@bar.total) #30 in total
  #   #Act
  #
  #   #Assert
  #   assert_equal(43.00, @room.bill)#@room.pay(guests)
  #
  # end

  #maybe pay total bill and check if guests together have the money they need to pay for the bill - or that it will warn you if your money is about to run out??

  #add a play song function and guest be all woohoo that the song is there?

  #add function that if you check into a room and it's full that you can go into another room that still has space?

  #try a file maybe like the snowman to run a Karaoke scenario???



end
