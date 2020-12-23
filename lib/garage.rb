class Garage
  def initialize
    @bikes = []
  end

  def accept_broken(bike)
    fail "Will not accept working bikes" unless bike.broken?
    bike.fix
    @bikes << bike
  end

  def return_working_bike
    @bikes.pop
  end
end
