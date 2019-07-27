require("pry")

class Room
  attr_reader :name, :capacity, :entry_fee, :bill, :max_tab, :playlist

  def initialize(name, capacity)
    @name = name
    @playlist = []
    @guests = []
    @capacity = capacity
    @entry_fee = 6.50
    @bill = 0.00
    @max_tab = 0
  end

  def song_count()
    return @playlist.count()
  end

  def guest_count()
    return @guests.count()
  end

  def check_in(guest)
    if guest.wallet >= @entry_fee
      unless is_full?()
        @guests.push(guest)
        guest.pay(@entry_fee)
        @bill += @entry_fee
      else
        return "Would you like to move to a bigger room?"
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
      return "OMG! They have #{guest.fav_song.name}. That's MY JAM!"
    else
      return "Awh.. #{guest.fav_song.name} is not on the playlist!"
    end
  end

  def add_to_bill(bartab)
    @bill += bartab
  end

  def check_money()
    total = 0
    @guests.each{ |guest| total += guest.wallet}

    return total
  end

  def play_song(song)
    return "Now playing... #{song.name} by #{song.singer}."
  end

  def remove_song(song)
    @playlist.delete(song)

    return "You have just deleted #{song.name} by #{song.singer}."
  end

  def closing_time()
    @guests.clear()
  end

  def move_song_to_front(song)
    @playlist[0] = song
  end

  def switch_song_position(song1, song2)

    if (@playlist.include?(song1) && @playlist.include?(song2))
      #get the indexes of both songs
      song1_position = @playlist.index(song1)
      song2_position = @playlist.index(song2)
      #move the songs to each other's position
      @playlist[song1_position] = song2
      @playlist[song2_position] = song1
    else
      return "Either one or both of the songs does not exist"
    end
  end

end
