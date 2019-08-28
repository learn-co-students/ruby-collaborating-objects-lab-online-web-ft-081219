require 'pry'

class MP3Importer
   attr_accessor :path
    
   def initialize(filepath)
      @path=filepath
 
   end

   def files
      #return array
      Dir.chdir(@path) do
         Dir.glob("*.mp3")
      end
   end

   def import
      files.each do |song_filename|
         Song.new_by_filename(song_filename)
      end
   end


end