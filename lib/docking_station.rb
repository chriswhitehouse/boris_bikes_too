class DockingStation
  attr_reader :bike

  def release_bike
    fail "No bike available" if @bike.nil?
    @bike
  end

  def dock(bike)
    @bike = bike
  end
end
