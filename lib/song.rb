class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

   def self.create
    song = self.new
    song.class.all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name  
    song  
  end 

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song 
  end

  def self.find_by_name(song_name)
    self.all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) 
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    split_file = filename.split(" - ")
    artist = split_file[0]
    song_name, mp3 = split_file[1].split(".mp3")

    song = self.new 
    song.artist_name = artist 
    song.name = song_name 
    song 
  end

  def self.create_from_filename(filename)
    split_file = filename.split(" - ")
    artist = split_file[0]
    song_name, mp3 = split_file[1].split(".mp3")
 

    song = self.create 
    song.artist_name = artist 
    song.name = song_name 
    song 
  end
  
  def self.destroy_all
    self.all.clear
  end
end