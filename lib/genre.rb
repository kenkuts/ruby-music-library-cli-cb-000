require_relative '../lib/concerns/findable.rb'
require 'pry'

class Genre
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name="")
    super(name)
    @songs = []
  end

  def artists
    @songs.collect{ |song| song.artist }.uniq.select{ |artist| artist != nil}
  end

end
