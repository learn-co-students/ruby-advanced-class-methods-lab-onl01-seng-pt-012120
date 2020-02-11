class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create #this builds the class constructor
    song = self.new
    self.all << song #this initializes a song and saves it to the @all class variable
    song #returns song instance that has been initialized and saved
  end

  def self.new_by_name(title)
    song = self.new #instantiates
    song.name = title #takes in the string name of a song and returns a song instance with name set as name property
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(title)
    result = self.all.detect {|song| song.name == title}
    result
  end

  def self.find_or_create_by_name(title)
    result = self.find_by_name(title)
    if result
      result
    else
      self.create_by_name(title)
    end
  end

  def self.alphabetical
    sorted = self.all.sort_by {|song| song.name}
    sorted
  end

  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3") #removing record separater
    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end

  def self.create_from_filename(filename)
    result = self.new_from_filename(filename) #initializes
    song = self.create #initializes
    song.name = result.name #saves song name
    song.artist_name = result.artist_name #saves artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
