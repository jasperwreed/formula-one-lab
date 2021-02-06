describe 'Driver' do
  
  let(:driver) { Driver.new('Sergio Perez', 11) }
  let(:driver2) { Driver.new('Sebastian Vettel', 5) }
  let(:driver3) { Driver.new('Max Verstappen', 33) }

  after(:each) do
    Driver.class_variable_set(:@@all, [])
  end

  describe '#new' do
    it 'is initialzed with a name' do
      expect(driver.instance_variable_get(:@name)).to eq('Sergio Perez')
    end

    it 'is initialized with a car number' do
      expect(driver.instance_variable_get(:@car_number)).to eq(11)
    end

    it 'pushes new instances into a class variable called @@all upon initialization' do
      expect(Driver.class_variable_get(:@@all)).to match([driver, driver2, driver3])
    end
  end

  describe '@@all' do
    it 'is a class variable set to an array' do
      expect(Driver.class_variable_get(:@@ll)).to be_a(Array)
    end
  end

  describe '.all' do
    it 'is a class method that returns an array of all driver instances that have been created' do
      expect(Driver.all).to match([driver, driver2, driver3])
    end
  end

  describe '#team' do
    it 'belongs to a team' do
      Aston = Team.new('Aston Martin', 'Seb')
      driver2.team = Aston
      expect(driver2.team).to eq(Aston)
    end
  end

end