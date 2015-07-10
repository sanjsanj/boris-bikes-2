require 'docking_station'
require 'support/shared_examples_for_bike_container'

describe DockingStation do
  let(:bike) { double :bike, broken?: false, working?: true }
  let(:broken_bike) { double :bike, broken?: true, working?: false }

  it_behaves_like BikeContainer

  it 'can dock a bike' do
    subject.dock :bike
    expect(subject).not_to be_empty
  end

  it 'releases a working bike' do
    subject.dock bike
    subject.release_bike
    expect(subject).to be_empty
  end

  it 'does not release a broken bike' do
    subject.dock broken_bike
    expect { subject.release_bike }.to raise_error 'No bikes available'
  end
end
