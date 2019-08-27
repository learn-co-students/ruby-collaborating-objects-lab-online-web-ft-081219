class MP3Importer 
  attr_accessor :path, :files 
  
  def initialize(music_path)
    @path = music_path
    @files = []
  end
  
 def files
    Dir.chdir(@path) do |path|
        @files = Dir.glob("*.mp3")
    end
  end
  
  def import
    self.files.each do |filename|
      Song.new_by_filename(filename)
    end
  end
end 