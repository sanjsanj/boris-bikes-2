class Garage
  include BikeContainer

  def fix_bikes
    puts '***' * 10
    p self
    self.bikes.each do |bike|
      p bike
      bike.fix
    end
    false
  end
end
