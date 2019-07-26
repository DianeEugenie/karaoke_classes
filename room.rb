require("pry")

class Room
  attr_reader :name, :capacity, :entry_fee, :bill, :max_tab

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

    @guests.each { |guest| total += guest.wallet }

    @max_tab += total

  end




# name_lengths = chickens.map {|chicken| chicken.length()}
#chickens.each { |chicken| name_lengths << chicken.length()}
  #p numbers.reduce { |total, number| total + number }

end
