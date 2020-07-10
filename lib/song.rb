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
    songs = self.new 
    a = self.find_by_name(song)
    if a == nil 
      self.create_by_name(song)
    else 
      a 
    end 
  end 
  
  def self.alphabetical
    a = []
    @@all.each do |song|
      a << song.name 
    end 
    a = a.sort 
    a.collect{|song| find_by_name(song)}
  end
  
  def self.new_from_filename(filename)
    a = filename.split("-")
    songs = self.new 
    songs.name = a[0]
    songs.artist = a[1][:a[1].size - 4 ]
    @@all << songs
    songs 
end
