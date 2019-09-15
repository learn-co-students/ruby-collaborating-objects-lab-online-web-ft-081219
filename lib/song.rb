require 'pry'
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
    song_info = file_name.split(" - ")
    new_song = self.new(song_info[1])
    new_song.artist_name = song_info[0]
    new_song
    #binding.pry
  end

  def artist_name=(name)
    new_artist = nil
    if Artist.all.detect {|artist| artist.name == name}
      new_artist = Artist.all.detect {|artist| artist.name == name}
    else
      new_artist = Artist.new(name)
    end
    self.artist = new_artist
  end

  


end