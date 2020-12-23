class Garage
  def initialize
    @broken_bikes = []
  end

  def accept_broken(bike)
    fail "Will not accept working bikes" if !bike.broken?
    @broken_bikes << bike
  end
end
