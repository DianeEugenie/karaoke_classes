class Room
  attr_reader :name

  def initialize(name)
    @name = name
    @playlist = []
    @guests = []
  end

  def song_count()
    return @playlist.count()
  end

  def guest_count()
    return @guests.count()
  end

  def check_in(guest)
    @guests.push(guest)
  end

  def check_out(guest)
    @guests.delete(guest)
  end

  def add_song(song)
    @playlist.push(song)
  end


end
