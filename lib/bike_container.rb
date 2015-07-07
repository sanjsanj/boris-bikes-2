module BikeContainer
  DEFAULT_CAPACITY = 20

  attr_accessor :capacity

  def initialize capacity = DEFAULT_CAPACITY
    @capacity = capacity
    @bikes = []
    @broken_bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    bikes.shift
  end

  def dock bike
    raise "#{self.class.name} full" if full?
    bike.working? ? bikes << bike : broken_bikes << bike
  end

  def add_bike bike
    raise "#{self.class.name} full" if full?
    bike.working? ? bikes << bike : broken_bikes << bike
  end

  # private

  attr_reader :bikes, :broken_bikes

  def total_bikes
    bikes.count + broken_bikes.count
  end

  def empty?
    bikes.empty?
  end

  def full?
    total_bikes >= capacity
  end
end
