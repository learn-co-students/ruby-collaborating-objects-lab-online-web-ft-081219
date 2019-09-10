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

    def artist=(artist)#pass in an object
       @artist = artist
       #binding.pry
       artist.add_song(self) 
    end

    def self.new_by_filename(song)
       
        song = song.split(" - ")
        
        artist = song[0]
        name = song[1]
        genre = song[2]

        new_song = Song.new(name)
        new_artist = Artist.new(artist)
        new_song.artist = new_artist
        
        new_song

    end

    def artist_name=(artist)
        p artist
        p "are we here"
        temp_artist = Artist.find_or_create_by_name(artist)
        self.artist = temp_artist    
           
    end

end