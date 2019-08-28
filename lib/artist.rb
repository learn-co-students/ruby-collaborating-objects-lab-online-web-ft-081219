class Artist
    attr_accessor :name
    @@all=[]

    def initialize(name)
        @name=name
        self.class.all.push(self)
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song|song.artist==self}
    end

    def add_song(song)
        song.artist=self
    end

    def self.find_or_create_by_name(name_arg)
        #access all array. search if any artist listed has an @name attr that matches argument
        #some kind of detect? some kind of enumerator accessing each one's @name value
        if self.all.any?{|artist|artist.name==name_arg}
            self.all.detect{|artist|artist.name==name_arg}
        else
            self.new(name_arg)
        end
    end

    def print_songs
        Song.all.select{|song|song.artist==self}.each{|song|puts song.name}
    end
end

