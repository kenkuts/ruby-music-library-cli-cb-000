require_relative '../lib/concerns/findable.rb'
require 'pry'

class Song
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name="", artist=nil, genre=nil)
    super(name)
    self.artist = artist
    self.genre = genre
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless @genre == nil || genre.songs.include?(self)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless @artist == nil
  end

  def self.new_from_filename(filename)
    file = filename.gsub(".mp3", "").split(" - ")
    artist = Artist.find_or_create_by_name(file[0])
    genre = Genre.find_or_create_by_name(file[2])
    Song.new(file[1], artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
  end
end
# binding.pry
