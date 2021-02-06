class Team

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, principal)
    @name = name
    @principal = principal

    @@all << self
  end

  def drivers
    Driver.all.select { |driver| driver.team == self }
  end

  def sponsors
    Sponsor.all.select { |sponsor| sponsor.team == self }
  end

end