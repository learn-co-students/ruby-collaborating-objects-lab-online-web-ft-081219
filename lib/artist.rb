class Artist

    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
        @songs = []
    end

    def self.all
        @@all
    end

    def add_song(song) #passed in an object
        @songs << song
    end

    def songs
        @songs
    end

    def self.find_or_create_by_name(name) #pass in a string, returns the name of artist if found.  if not found creates a new artist object and returns the name
        found_artist = nil
        
        @@all.each do |artist|
            if artist.name == name
                found_artist = artist
            end
        end

        if found_artist == nil
            found_artist = Artist.new(name)
        end

        found_artist
    end

    def print_songs
        @songs.each do |song|
            puts song.name
        end
    end



end
