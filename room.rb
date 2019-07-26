class Room
  attr_reader :name, :capacity, :entry_fee

  def initialize(name, capacity)
    @name = name
    @playlist = []
    @guests = []
    @capacity = capacity
    @entry_fee = 6.50
  end

  def song_count()
    return @playlist.count()
  end

  def guest_count()
    return @guests.count()
  end

  def check_in(guest)
    @guests.push(guest) unless @guests.count() == @capacity
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
