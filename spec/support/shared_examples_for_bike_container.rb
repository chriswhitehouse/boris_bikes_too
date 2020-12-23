shared_examples_for BikeContainer do


  describe '#capacity' do
    it 'has a default value when initialized' do
      expect(subject.capacity).to eq BikeContainer::DEFAULT_CAPACITY
    end

    it 'can be overridden on initialize' do
      random_capacity = Random.rand(100)
      subject = described_class.new random_capacity
      expect(subject.capacity).to eq random_capacity
    end
  end

  describe '#add' do
    it 'receives a bike' do
      subject.add double :bike
      expect(subject).not_to be_empty
    end

    it 'raises an error when full' do
      subject.capacity.times { subject.add double(:bike) }
      expect { subject.add double(:bike) }.to raise_error "#{described_class.name} full"
    end
  end

  describe '#remove_bike' do
    let(:bike) { Bike.new }
    before(:each) { subject.add bike }

    it 'returns a bike' do
      expect(subject.remove_bike).to eq bike
    end

    it 'removes the bike from the collection' do
      subject.remove_bike
      expect(subject).to be_empty
    end

    it 'raises an error when empty' do
      subject.remove_bike
      expect { subject.remove_bike }.to raise_error "#{described_class.name} empty"
    end
  end
end
