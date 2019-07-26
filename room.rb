require("pry")

class Room
  attr_reader :name, :capacity, :entry_fee, :bill

  def initialize(name, capacity)
    @name = name
    @playlist = []
    @guests = []
    @capacity = capacity
    @entry_fee = 6.50
    @bill = 0.00
  end

  def song_count()
    return @playlist.count()
  end

  def guest_count()
    return @guests.count()
  end

  def check_in(guest)
    if guest.wallet >= @entry_fee
      unless @guests.count() == @capacity
        @guests.push(guest)
        guest.pay(@entry_fee)
        @bill += @entry_fee
      end
    else
      return "The entry fee is 6.50."
    end
  end

  def check_out(guest)
    @guests.delete(guest)
  end

  def add_song(song)
    @playlist.push(song)
  end

  def is_full?()
    return @guests.count() == @capacity
  end

  def check_playlist(guest)
    if @playlist.include?(guest.fav_song)
      return "That's MY JAM!"
    else
      return "Awh.. #{guest.fav_song.name} is not on the playlist!"
    end
  end

  def add_to_bill(bartab)
    @bill += bartab
  end







end
