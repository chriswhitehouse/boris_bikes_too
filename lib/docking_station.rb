class DockingStation
  attr_reader :bikes, :capacity

  CAPACITY = 20

  def initialize
    @bikes = []
  end

  def dock(bike)
    fail "Docking station full" if @bikes.length >= CAPACITY
    @bikes << bike
  end

  def release_bike
    fail "No bike available" if @bikes.empty?
    @bikes.pop
  end
end
