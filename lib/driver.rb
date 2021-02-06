class Driver

  @@all = []

  def self.all
    @@all
  end

  attr_accessor :team
  attr_reader :name, :car_number

  def initialize(name, car_number)
    @name = name
    @car_number = car_number
    @team = team

    @@all << self
  end

end