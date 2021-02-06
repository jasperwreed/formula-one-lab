describe 'Team' do
   
  let(:team) { Team.new('Aston Martin', 'Seb') }
  let(:team2) { Team.new('RedBull Racing', 'Christian Horner') }

  after(:each) do
    Team.class_variable_set(:@@all, [])  
  end

  describe '#new' do
    it 'is initialized with a name' do
      expect(team.instance_variable_get(:@name)).to eq('Aston Martin')
    end

    it 'is initialized with a team principal' do
      expect(team.instance_variable_get(:@principal)).to eq('Seb')
    end

    it 'pushes new instances into a class varibale called @@all upon initialzation' do
      expect(Team.class_variable_get(:@@all)).to match([team, team2])
    end
  end

  describe '@@all' do
    it 'is a class variable set to an array' do
      expect(Team.class_variable_get(:@@all)).to be_a(Array)
    end
  end

  describe '.all' do
    it 'is a class method that returns an array of all team instances that have been created' do
      expect(Team.all).to match([team, team2])
    end
  end

  describe '#drivers' do
    it 'has many drivers' do
      expect(team2.drivers).to be_a(Array)
      Max = Driver.new('Max Verstappen', 33)
      Sergio = Driver.new('Sergio Perez', 11)
      Max.team = team2
      Sergio.team = team2
      expect(team2.drivers).to eq([Max, Sergio])
    end
  end

  describe '#sponsors' do
    it 'has many sponsors' do
      expect(team.sponsors).to be_a(Array)
      sponsor = Sponsor.new('Cognizant')
      sponsor.team = team
      expect(team.sponsors).to eq([sponsor])
    end
  end

end