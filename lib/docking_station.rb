require 'bike_container'

class DockingStation
  include BikeContainer

  def dock(bike)
    add bike
  end

  def release_bike
    fail "No bike available" if working_bikes.empty?
    bikes.delete working_bikes.pop
  end

  private

  def working_bikes
    bikes.reject { |bike| bike.broken? }
  end
end
