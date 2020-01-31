class Song
  
  attr_accessor :name, :artist_name
 
  @@all = []
  
  def self.create
    @@all << self.new
    @@all[-1]
  end
  
  def self.new_by_name(title)
    @@all << self.new
    @@all[-1].name = title
    @@all[-1]
  end
  
  def self.create_by_name(title)
    @@all << self.new
    @@all[-1].name = title
    @@all[-1]
  end
  
  def self.find_by_name(title)
    @@all.find{|song| song.name == title} 
  end
  
  def self.find_or_create_by_name(title)
   self.find_by_name(title) || self.create_by_name(title)
  end
  
  def self.alphabetical
    @@all.sort_by{|x| x.name}
  end
  
  def self.new_from_filename(file)
    self.create
    @@all[-1].name = (file.split(" - ")[1].chomp(".mp3"))
    @@all[-1].artist_name = (file.split(" - ")[0])
    @@all[-1]
  end
  
  def self.create_from_filename(file)
    self.create
    @@all[-1].name = (file.split(" - ")[1].chomp(".mp3"))
    @@all[-1].artist_name = (file.split(" - ")[0])
    @@all[-1]
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
