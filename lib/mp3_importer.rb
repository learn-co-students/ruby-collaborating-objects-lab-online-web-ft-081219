
require 'pry'

class MP3Importer 
   attr_accessor :path 
   
   
  def initialize(path)      
    @path = path 
    #binding.pry 
    
  end 
  
  def files
     
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end 
   
  def import
    future_array = self.files.collect{|words| Song.new_by_filename(words) } 
    
    
    #binding.pry 
  end
 
   
 end 
 
 