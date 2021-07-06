class Artist
 @@all = []
   attr_accessor :name
   
   def initialize(name)
     @songs = []
     @name = name
     @@all << self
   end
   
   def self.all
     @@all
   end
   def songs
     Song.find_by_artist(self)
   end
   
   def add_song(song)
     @songs << song
     song.artist = self
   end
   
   def self.find_or_create_by_name(name)
     self.find(name) ? self.find(name) : self.create(name)
   end
   
   def self.find(name)
     self.all.find {|artist| artist.name == name }
   end
   
   def self.create(name)
     self.new(name).tap {|artist| artist}
   end
   
   def print_songs
     songs.each {|song| puts song.name}
   end
end