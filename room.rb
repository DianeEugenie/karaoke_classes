class Room
  attr_reader :name

  def initialize(name)
    @name = name
    @playlist = []
  end

  def song_count()
    return @playlist.count()
  end

  def add_song(song)
    @playlist.push(song)
  end


end
