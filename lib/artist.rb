class Artist

  attr_accessor :name, :songs
  @@all = []

  #returns an array of all artists
  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def save
    @@all << self
  end

  #finds or creates an artist instance based on a string of an artist name
  def self.find_or_create_by_name(artist_name)
    found = all.find do |artist_instance|
      artist_instance.name == artist_name
    end
    found != nil ? found : new(artist_name)
  end

  #adds a song to the artist's collection
  def add_song(song_instance)
    songs << song_instance
    # song_instance.artist = self
  end

  #prints songs that belong to the artist
  def print_songs
    songs.each do |song|
      puts song.name
    end
  end

end
