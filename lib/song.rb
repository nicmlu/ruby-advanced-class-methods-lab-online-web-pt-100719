class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    song = self.new
    @@all.push(song)
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    # @@all.push(song)
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all.push(song)
    song
  end
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical 
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(file_name)
    rows = file_name.split("-")
    songs = rows.collect do |row|
    data = row.split(".")
    artist_name = data[0]
    name = data[1]
    
    song = self.new
    song.artist_name = artist_name
    song.name = name
    end
    songs
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
end
