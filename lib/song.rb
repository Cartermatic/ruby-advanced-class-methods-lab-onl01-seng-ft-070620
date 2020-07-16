class Song
  attr_accessor :name, :artist_name
  @@all = []
 
  def self.create
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end
 
  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
 
  def self.find_or_create_by_name(song)
   self.find_by_name(song) || self.create_by_name(song)
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(song)
    name_and_artist = song.split(" - ")
    artist_name = name_and_artist[0]
    name = name[1]
    artist_name.chomp
  end
  
  def self.all
    @@all
  end
 
  def save
    self.class.all << self
  end
 
end