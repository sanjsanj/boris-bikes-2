require 'bike'

class DockingStation
  include BikeContainer

  def release_bike
    raise 'No bikes available' if working_bikes.empty?
    bikes.delete working_bikes.pop
  end

  def dock bike
    add_bike bike
  end

  private
  def working_bikes
    bikes.reject { |bike| bike.broken? }
  end
end
