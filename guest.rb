class Guest

  attr_reader :name, :fav_song, :wallet

  def initialize(name, fav_song, wallet)
    @name = name
    @fav_song = fav_song
    @wallet = wallet
  end

  def fav_song()
    return @fav_song
  end

  def pay(fee)
    @wallet -= fee
  end

end
