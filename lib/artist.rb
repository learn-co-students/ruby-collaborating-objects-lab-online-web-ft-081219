class Artist
  attr_accessor :name, :song

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
        @songs = []
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
        @songs << song
    end

    def self.find(name)
    @@all.find {|artist| artist.name == name}
    end

    def self.find_or_create_by_name(name)
        if self.find(name)
            self.find(name)
        else
            Artist.new(name)
        end
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def print_songs
        puts @songs.collect {|s| s.name}
    end
end
