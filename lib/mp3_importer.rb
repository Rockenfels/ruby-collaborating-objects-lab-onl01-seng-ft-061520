require 'pry'
class MP3Importer
  attr_reader :path
  
  def initialize(path)
    @path  = path
  end
  
  def files
    raw_files = Dir[@path + "/*"]
    
    files = []
    raw_files.each do |file|
      song_name = file.slice(21, file.length-1)
      files << song_name
    end
    files
  end
  
  def import
    self.files.each do |file|
     Song.new_by_filename(file)
    end
  end
end