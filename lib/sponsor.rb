class Sponsor

  @@all = []

  def self.all
    @@all
  end

  attr_accessor :team
  attr_reader :name

  def initialize(name)
    @name = name
    @team = team

    @@all << self
  end
end