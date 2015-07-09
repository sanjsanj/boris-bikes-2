module BikeContainer
  DEFAULT_CAPACITY = 20

  attr_accessor :capacity

  def initialize capacity = DEFAULT_CAPACITY
    @capacity = capacity
    @bikes = []
  end

  def remove_bike
    fail "#{self.class.name} empty" if empty?
    bikes.shift
  end

  def add_bike bike
    fail "#{self.class.name} full" if full?
    bikes << bike
  end

  # private

  attr_reader :bikes

  def empty?
    bikes.empty?
  end

  def full?
    bikes.count >= capacity
  end
end
