shared_examples_for BikeContainer do
  let(:bike) { double :bike, working?: true }
  let(:not_a_bike) { double :not_a_bike }

  it 'has a default capacity when initialized' do
    expect(subject.capacity).to eq BikeContainer::DEFAULT_CAPACITY
  end

  describe 'capacity' do
    it 'can be overridden on initialize' do
      random_capacity = Random.rand(100)
      subject = described_class.new random_capacity
      expect(subject.capacity).to eq random_capacity
    end
  end

  describe 'add_bike' do
    it 'receives a bike' do
      subject.add_bike bike
      expect(subject).not_to be_empty
    end

    it 'raises an error when full' do
      full_error = "#{described_class.name} full"
      subject.capacity.times { subject.add_bike bike }
      expect { subject.add_bike bike }.to raise_error full_error
    end

    it 'raises an error if adding anything except a bike' do
      expect { subject.add_bike not_a_bike }.to raise_error "Not a bike"
    end
  end

  describe 'remove_bike' do
    before(:each) { subject.add_bike bike }

    it 'returns a bike' do
      expect(subject.remove_bike).to eq bike
    end

    it 'removes the bike from the collection' do
      subject.remove_bike
      expect(subject).to be_empty
    end

    it 'raises an error when empty' do
      empty_error = "#{described_class.name} empty"
      subject.remove_bike
      expect { subject.remove_bike }.to raise_error empty_error
    end
  end
end
