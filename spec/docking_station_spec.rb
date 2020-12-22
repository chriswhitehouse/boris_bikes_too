describe DockingStation do
  let(:bike) { Bike.new }

  describe "#release_bike" do
    it "releases working bikes when one is available" do
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end

    it "raises an error when no bikes are available" do
      expect { subject.release_bike }.to raise_error "No bike available"
    end
  end

  describe "#dock" do
    it "docks a bike" do
      expect(subject.dock(bike)).to include bike
    end

    it "raises an error when docking station is full" do
      DockingStation::CAPACITY.times { subject.dock(bike) }
      expect { subject.dock(bike) }.to raise_error "Docking station full"
    end
  end

  describe "#bike" do
    it "returns docked bikes" do
      subject.dock(bike)
      expect(subject.bikes).to include bike
    end
  end
end
