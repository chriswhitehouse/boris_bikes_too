describe DockingStation do
  describe "#new" do
    it "has a deafult capacity" do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it 'has a variable capacity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock(Bike.new) }
      expect{ docking_station.dock(Bike.new) }.to raise_error "Docking station full"
    end
  end

  describe "#release_bike" do
    it "releases working bikes when one is available" do
      subject.dock(Bike.new)
      expect(subject.release_bike).not_to be_broken
    end

    it "raises an error when no bikes are available" do
      expect { subject.release_bike }.to raise_error "No bike available"
    end

    it "raises an error when no working bikes are available" do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error "No bike available"
    end
  end

  describe "#dock" do
    it "docks a bike" do
      bike = Bike.new
      expect(subject.dock(bike)).to include bike
    end

    it "raises an error when docking station is full" do
      subject.capacity.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error "Docking station full"
    end
  end

  # describe "#bike" do
  #   it "returns docked bikes" do
  #     bike = Bike.new
  #     subject.dock(bike)
  #     expect(subject.bikes).to include bike
  #   end
  # end
end
