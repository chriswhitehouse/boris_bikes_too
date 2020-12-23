require 'bike_container'

class Van
  include BikeContainer

  def take_broken(bike)
    fail "Will not take working bike" unless bike.broken?
    add bike
  end

  def deliver_broken_bike
    fail "No bike available" if broken_bikes.empty?
    bikes.delete broken_bikes.pop
  end

  def collect_working(bike)
    fail "Will not take broken bike" if bike.broken?
    add bike
  end

  def distribute_working_bike
    fail "No bike available" if working_bikes.empty?
    bikes.delete working_bikes.pop
  end

  private

  def working_bikes
    bikes.reject { |bike| bike.broken? }
  end

  def broken_bikes
    bikes.reject { |bike| !bike.broken? }
  end
end
