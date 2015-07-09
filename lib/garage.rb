class Garage
  include BikeContainer

  def fix_bikes
    self.bikes.each(&:fix)
  end
end
