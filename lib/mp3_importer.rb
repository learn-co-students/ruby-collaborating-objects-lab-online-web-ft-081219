require 'pry'
class MP3Importer 
attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  #files gets called by #import and returns an array
    #Make sure you only get .mp3
    #write code that responds to MP3Importer.new('./spec/fixtures').import
    #Dir class 
    #Dir.for each(pathname) do {|file_name| } end
  def files 
     file_names = Dir.glob(@path+"/*.mp3").map{ |file| file.gsub("#{@path}/","") }
     
  end
  #import takes each normalized filename and sends it to the Song class #new_by_filename
      #which creates a new song instance for each of the filenames
    # #import calls #files
    #so it is calling the method on the MP3Importer instance
    #import is collaborating with Song instances by calling a Song method (new_by_filename) which creates a new song for every item in the array
  def import 
     files.each {|file| Song.new_by_filename(file)}
  end
end