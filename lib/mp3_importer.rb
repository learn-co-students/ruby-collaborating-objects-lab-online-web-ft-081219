require 'pry'
class MP3Importer

    attr_accessor :path
    @@all = []

    def initialize(path)
        @path = path
        @@all << self
        @new_files = Dir.entries(@path)
        @new_files.shift
        @new_files.shift
      
    end

    def files
        @new_files
    end

    def import

        
        @new_files.each do |song|
            Song.new_by_filename(song)
            #song = song.split(" - ")
            #artist = song[0]
            #name = song[1]
            #genre = song[2]
            #new_song = Song.new_by_filename(name)
            #new_artist = Artist.new(artist)
            #new_song.artist = new_artist

        end

    end



end