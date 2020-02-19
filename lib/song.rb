

class Song
  attr_accessor :name, :artist_name
  @@all = []
  def initialize(name=nil, artist_name=nil)
    @name = name
end

  def self.all
    @@all
  end
  

  def self.create
    song = Song.new
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    song = Song.new(name)
    song 
  end
  
  def self.create_by_name(name)
    song = Song.new(name)
    @@all << song
    song 
  end
  
  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end
  
  def self.find_or_create_by_name(name)
   if self.find_by_name(name)
     self.find_by_name(name)
    else 
      self.create_by_name(name)
  end
end
  
  def self.alphabetical
    @@all.sort_by { |song| song.name }
end
  
  
  def self.new_from_filename(name)
    split_string = name.split(' - ')
    artist_name = split_string[0]
    song_name = split_string[1].gsub!('.mp3', '')
    song = Song.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  
  
  def self.create_from_filename(name)
    split_string = name.split(' - ')
    artist_name = split_string[0]
    song_name = split_string[1].gsub!('.mp3', '')
    song = Song.create
    song.name = song_name
    song.artist_name = artist_name
    song
end

  
  
  def self.destroy_all
    @@all.clear
  end
  
end

