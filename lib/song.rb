class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  
  def self.create 
    song = self.new 
    @@all << song
    return song 
  end 

  def save
    self.class.all << self
  end
  
  def self.new_by_name(song)
    songs = self.new 
    songs.name = song
    songs 
  end 
  
  def self.create_by_name(song)
    songs = self.new 
    songs.name = song
    @@all << songs
    songs 
  end 
  
  def self.find_by_name(song)
    self.all.find{|seng| seng.name == song}
  end 
  
  def self.find_or_create_by_name(song)
    a = self.all.find{|seng| seng.name == song} 
    songs = self.new 
    if a == nil 
      self.create_by_name(song)
    else 
      a 
    end 
  end 
end
