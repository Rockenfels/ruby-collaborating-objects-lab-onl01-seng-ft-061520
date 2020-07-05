
class Song
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.new_by_filename(name)
    data = name.slice(0, name.length - 4).split(" - ")
    song = Song.new(data[1])
    song.genre = data[2]
    song.artist_name=(data[0])
    song
  end
  
  def artist_name=(name)
    your_artist = Artist.find_or_create_by_name(name)
    self.artist = your_artist
  end
end