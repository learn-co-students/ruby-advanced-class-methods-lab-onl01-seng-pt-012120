class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

def self.create
  song = self.new 
  song.save
  song 
end 

def self.new_by_name(str)
  song = self.new
  song.name = str 
  song 
end 

def self.create_by_name(str)
  song = self.new
  song.name = str 
  song.save
  song 
end 

def self.find_by_name(str)
  @@all.find {|x| p x.name.include?(str)}
end 

def self.find_or_create_by_name(str)
  self.find_by_name(str) || self.create_by_name(str)
end 

def self.alphabetical 
  @@all.sort_by {|s| s.name}
end 

def Song.new_from_filename(str)
  new = str.split(" - ")
  songname = new[1].split(".mp3").join
  artistname = new [0]
  
  song = self.new
  song.name = songname
  song.artist_name = artistname
  p song 
end

def self.create_from_filename(str)
  new = str.split(" - ")
  songname = new[1].split(".mp3").join 
    artistname = new[0]
    
    song = self.create 
    song.name = songname
    song.artist_name = artistname
    p song
end 


def self.destroy_all
  @@all = []
end 

end
