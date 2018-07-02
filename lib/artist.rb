require_relative '../lib/concerns/findable.rb'
require 'pry'

class Artist
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name="")
    super(name)
    @songs = []
  end

  def add_song(song)
    song.artist = self if song.artist != self
    self.songs << song unless @songs.include?(song)
  end

  def genres
    @songs.collect{ |song| song.genre }.uniq.select{ |genre| genre != nil}
  end
end
