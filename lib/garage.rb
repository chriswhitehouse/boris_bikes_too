require 'bike_container'

class Garage
  include BikeContainer

  def accept_broken(bike)
    fail "Will not accept working bikes" unless bike.broken?
    add bike
  end

  def return_working_bike
    remove_bike
  end

  def fix_bikes
    bikes.map { |bike| bike.fix }
  end
end
