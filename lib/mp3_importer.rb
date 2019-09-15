require 'pry'
class MP3Importer

  attr_accessor :path

  @@import_files = []

  def initialize(path)
    @path = path
  end

  def files 
    files = Dir.glob("#{@path}/*.mp3")
    @@import_files = files.map {|file_name| file_name.gsub("#{@path}/", "")}

    #binding.pry
  end

  def import
    @@import_files.each {|file| Song.new_by_filename(file)}
  end



end