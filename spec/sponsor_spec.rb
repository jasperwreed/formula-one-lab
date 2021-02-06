describe 'Sponsor' do
  
  let(:sponsor) { Sponsor.new('Cognizant') }
  let(:sponsor2) { Sponsor.new('Dell') }

  after(:each) do
    Sponsor.class_variable_set(:@@all, [])
  end

  describe '#new' do
    it 'is initialized with a name' do
      expect(sponsor.instance_variable_get(:@name)).to eq('Cognizant')
    end

    it 'pushes new instances into a class varibale called @@all upon initialzation' do
      expect(Sponsor.class_variable_get(:@@all)).to match([sponsor, sponsor2])
    end
  end

  describe '@@all' do
    it 'is a class variable set to an array' do
      expect(Sponsor.class_variable_get(:@@all)).to be_a(Array)
    end
  end

  describe '.all' do
    it 'is a class method that returns an array of all sponsor instances that have been created' do
      expect(Sponsor.all).to match([sponsor, sponsor2])
    end
  end

  describe '#team' do
    it 'belongs to a team' do
      Meclaren = Team.new('Meclaren', 'Zach Brown')
      sponsor2.team = Meclaren
      expect(sponsor2.team).to eq(Meclaren)
    end
  end

end