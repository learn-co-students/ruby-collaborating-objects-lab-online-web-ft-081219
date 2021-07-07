class Artist
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name 
    @@all << self
  end 

  def add_song(song)
    song.artist = self
  end
  
   def self.find_or_create_by_name(artist_name)
    if self.find(artist_name)
      self.find(artist_name)
    else
      self.create(artist_name)
    end
  end

  def self.find(name)
    self.all.detect {|artist| artist.name == name}
  end

  def self.create(name)    
    artist = Artist.new(name)
  end
  

  def print_songs
    self.songs.each{|song| puts "#{song.name}"}
  end

  def self.all
      @@all
  end

  def songs
    Song.all.select{|song| song.artist == self}
  end

end
    
    