class Room
  attr_reader :name, :capacity, :entry_fee, :till

  def initialize(name, capacity)
    @name = name
    @playlist = []
    @guests = []
    @capacity = capacity
    @entry_fee = 6.50
    @till = 0
  end

  def song_count()
    return @playlist.count()
  end

  def guest_count()
    return @guests.count()
  end

  def check_in(guest)
    unless @guests.count() == @capacity
      @guests.push(guest)
      guest.pay(@entry_fee)
      @till += @entry_fee
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






end
