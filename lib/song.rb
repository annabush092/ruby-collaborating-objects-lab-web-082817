require 'pry'
require_relative './artist.rb'

class Song

  attr_accessor :name
  attr_reader :artist

  def initialize(song_name)
    @name = song_name
  end

#creates a new song from a filename, filling out the @name, and associating it with an Artist class
  def self.new_by_filename(song_file)
    #parse the filename into song data
    artist_from_file, song_name, genre_and_mp3 = song_file.split(" - ")
    #create a new Song instance, giving it a name
    new_song = Song.new(song_name)

    #associate the song with an Artist
    new_song.artist = Artist.find_or_create_by_name(artist_from_file)
    new_song.artist.add_song(new_song)

    #returns the new song instance
    new_song
  end

  #stores the artist object in the @artist
  def artist=(artist_object)
    @artist = artist_object
  end

end
