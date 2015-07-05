require 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_accessor :capacity

  def initialize capacity = DEFAULT_CAPACITY
    @capacity = capacity
    @bikes = []
    @broken_bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    bikes.pop
  end

  def dock bike
    fail 'Docking station full' if full?
    bike.working? ? bikes << bike : broken_bikes << bike
  end

  private

  attr_reader :bikes, :broken_bikes

  def empty?
    bikes.empty?
  end

  def full?
    (bikes.count + broken_bikes.count) >= capacity
  end
end
