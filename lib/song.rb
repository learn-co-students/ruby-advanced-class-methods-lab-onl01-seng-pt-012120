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
    return song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end
  
  def self.find_by_name(name)
      @@all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song
      song
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical 
    @@all.sort_by {|x| x.name }
  end
  
  def self.new_from_filename(name)
    song = self.new
    z = name.split(" - ")
    z.each do |x|
      y = x.chars
      if y.include?(".")
        a = y.join
        b = a.split(".")
        b.delete(b[-1])
        c = b.join
        song.name = c
      else
        song.artist_name = y.join 
      end 
    end
    song
  end
  
  def self.create_from_filename(name)
    song = self.new
    z = name.split(" - ")
    z.each do |x|
      y = x.chars
      if y.include?(".")
        a = y.join
        b = a.split(".")
        b.delete(b[-1])
        c = b.join
        song.name = c
      else
        song.artist_name = y.join 
      end
    end
    song.save
  end
  
  def self.destroy_all
    @@all.clear
  end
end
