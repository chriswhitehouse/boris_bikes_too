class Van
  attr_reader :broken_bikes

  def initialize
    @broken_bikes = []
    @working_bikes = []
  end

  def take_broken(bike)
    fail "Will not take working bike" unless bike.broken?

    @broken_bikes << bike
  end

  def deliver_broken_bike
    @broken_bikes.pop
  end

  def collect_working(bike)
    @working_bikes << bike
  end

  def distribute_working_bike
    @working_bikes.pop
  end
end
