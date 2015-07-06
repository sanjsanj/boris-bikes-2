require 'docking_station'

describe DockingStation do
  let(:bike) { double :bike, working?: true }
  let(:broken_bike) { double :bike, working?: false }

  it 'responds to release bike' do
    expect(subject).to respond_to :release_bike
  end

  it 'releases working bikes' do
    subject.dock bike
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'does not release broken bikes' do
    subject.dock broken_bike
    expect { subject.release_bike }.to raise_error 'No bikes available'
  end

  it 'responds to dock with 1 arg' do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'capacity can be set' do
    docking_station = DockingStation.new 50
    expect(docking_station.capacity).to eq 50
  end

  it 'capacity can be changed' do
    docking_station = DockingStation.new
    docking_station.capacity = 10
    expect(docking_station.capacity).to eq 10
  end

  describe 'release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe 'dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.dock bike  }
      expect { subject.dock bike }.to raise_error 'Docking station full'
    end
  end
end
