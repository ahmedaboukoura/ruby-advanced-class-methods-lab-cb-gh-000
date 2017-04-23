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
    song = Song.new
    self.all << song
    song
  end
  def self.new_by_name(name)
    cool = Song.new
    cool.name = name
    cool
  end
  def self.create_by_name(name)
    cool = Song.new
    self.all << cool
    cool.name = name
    cool
  end
  def self.find_by_name(name)
    @@all.detect{|song| song.name==name}
  end
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
       self.find_by_name(name)
    else
       self.create_by_name(name)
     end
  end
  def self.alphabetical
    @@all.sort_by{|w|w.name}
  end
  def self.new_from_filename(songa)
    song = Song.new
    song.artist_name =songa.split(' - ')[0]
    song.name = songa.split(' - ')[1].gsub('.mp3','')
    song
  end
  def self.destroy_all
    self.all.clear
  end
  def self.create_from_filename(filename)
  parts = filename.split(" - ")
  artist_name = parts[0]
  song_name = parts[1].gsub(".mp3", "")

  song = self.create
  song.name = song_name
  song.artist_name = artist_name
  song
end
end
