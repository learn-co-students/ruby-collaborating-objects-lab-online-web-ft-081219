require "pry"
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
    Song.all.select{|s| s.artist == self}
  end
  # binding.pry 
  
  def self.find_or_create_by_name(artist_name)
    self.find(artist_name)|| self.create(artist_name)
  end 
  
  def self.find(artist_name)
    self.all.find{|artist_obj| artist_obj.name == artist_name}
  end 
  
  def self.create(artist_name)
    Artist.new(artist_name)
  end 
  
  def print_songs
    self.songs.each{|songs| puts "#{songs.name}"}
  end 
end 


