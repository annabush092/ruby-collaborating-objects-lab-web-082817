require 'pry'
require_relative "./song.rb"

class MP3Importer

  attr_accessor :path

  def initialize(url)
    @path = url
  end

  def files
    Dir.entries(@path).select do |filename|
      filename.end_with?(".mp3")
    end
  end

#imports song files from a directory and creates new instances of the Song class for each file.
  def import
    files.each do |song_file|
      Song.new_by_filename(song_file)
    end
  end
end

# blah = MP3Importer.new("./db/mp3s/")
# blah.import
