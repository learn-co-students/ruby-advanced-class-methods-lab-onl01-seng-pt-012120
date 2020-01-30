require "pry"

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
    # the following do not pass the tests
    # @@all << self.new 
    # ============
    self.class.all << self.new
    # ============
    # save
  end
end
