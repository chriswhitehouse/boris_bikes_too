class Van
  attr_reader :broken_bikes

  def initialize
    @broken_bikes = []
  end

  def take_broken(bike)
    fail "Will not take working bike" if !bike.broken?
    @broken_bikes << bike
  end

  def deliver_broken_bike
    @broken_bikes.pop
  end


end
