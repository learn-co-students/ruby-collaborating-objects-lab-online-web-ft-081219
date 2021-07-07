require "pry"
class Song 
  attr_accessor :name, :artist
  @@all=[] 
  
  def initialize(name)
    @name=name
    save  
  end
  
  def save 
    @@all << self
  end
  
  def self.all 
    @@all
  end
  
  def self.new_by_filename(filename)
        song_array = filename.split(" - ")
        song_name = song_array[1]
        artist_name = song_array[0]
        @song = self.new(song_name)
        @song.artist_name= artist_name
        @song
        # binding.pry
    end
    
  
  def artist_name=(artist_name)
    @artist = Artist.find_or_create_by_name(artist_name)
    @artist.add_song(self)
  end
  
  
end