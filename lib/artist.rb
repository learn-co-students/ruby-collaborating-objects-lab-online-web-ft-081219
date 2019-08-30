
class Artist 
  attr_accessor :name, :songs
 @@all = []

  def initialize(name)
    @name = name
    @songs =[]
    save
  end
  
 def self.all 
  @@all 
  end
  
  def save 
    @@all << self 
    #self will be the instance of the artist(self)
  end
  
  def songs
    Song.all.select{|song| song.artist == self}
  end
  
  def add_song(song)
    song.artist = self
  end

  
  def self.find_or_create_by_name(artist_name)
    self.all.find{|artist_object| artist_object.name == artist_name} || self.new(artist_name)
  end
  #if an artist already exists put out that artist(if truthy will return) OR(||) if not creates a new artist with .new method(if falsey will return)
  
  def print_songs
  self.songs.each{|song| puts "#{song.name}"} 
  #Artist.songs.each runs through the array of Artist songs and puts out the #songs name
end
end