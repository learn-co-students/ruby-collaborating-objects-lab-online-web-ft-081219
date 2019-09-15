class Artist 
  
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def self.all 
    @@all
  end

  def songs
    Song.all.select {|song| song.artist == self}
  end

  def add_song(song)
    song.artist = self
    @songs << song
  end


  def self.find_or_create_by_name(name)
    if artist = self.all.detect {|artist| artist.name == name}
      artist 
    else
      artist = Artist.new(name)
      artist
    end
  end

  def print_songs
    puts @songs.collect {|song| song.name}
  end




end