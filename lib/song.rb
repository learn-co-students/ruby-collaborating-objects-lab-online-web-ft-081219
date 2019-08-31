class Song 
  
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.new_by_filename(file_name)
    file_name_parts = file_name.split(' - ')
    artist_name = file_name_parts[0]
    song_name = file_name_parts[1]
    @song = Song.new(song_name)
    @song.artist_name = artist_name
    @song
  end 
  
  def artist_name=(artist_name)
    @artist = Artist.find_or_create_by_name(artist_name)
    @artist.songs << self
  end 
end 