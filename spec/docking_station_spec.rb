require 'docking_station'

describe DockingStation do
  it 'responds to release bike' do
    expect(subject).to respond_to :release_bike
  end

  it 'releases working bikes' do
    subject.dock Bike.new
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'responds to dock with 1 arg' do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  describe 'release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end
end
