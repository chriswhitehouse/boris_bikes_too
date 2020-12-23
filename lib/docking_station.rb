class DockingStation
  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @working_bikes = []
    @broken_bikes = []
    @capacity = capacity
  end

  def dock(bike)
    fail "Docking station full" if full?
    if bike.broken?
      @broken_bikes << bike 
    else
      @working_bikes << bike
    end
  end

  def release_bike
    fail "No bike available" if empty?
    @working_bikes.pop
  end

  private

  attr_reader :bikes

  def full?
    @working_bikes.length + @broken_bikes.length >= @capacity
  end

  def empty?
    @working_bikes.empty?
  end
end
