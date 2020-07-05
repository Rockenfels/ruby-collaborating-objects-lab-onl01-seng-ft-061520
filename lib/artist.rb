require 'pry'
class Artist
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def add_song(song)
    song.artist = self
  end
  
  def songs
    Song.all.reject {|song| song.artist != self}
  end
  
  def self.find_or_create_by_name(artist)
     if self.all.length < 1 
      new_artist = self.new(artist)
      new_artist
     else
      @@all.each do |el|
        return el if el.name == artist
      end
      new_artist = self.new(artist) if !@@all.indlude?(artist)
    end
  end
  
  def print_songs
    songs = songs()
    songs.each do |song|
      puts song.name + "\n"
    end
  end
end