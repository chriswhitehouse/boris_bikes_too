require "docking_station"
require "bike"

describe "User Story:" do
  let(:docking_station) { DockingStation.new }
  let(:bike) { Bike.new }
  let(:van) { Van.new }
  let(:garage) { Garage.new }

  describe "1. So that I can use a bike," do
    it "I'd like a docking station to release a bike." do
      docking_station.dock(bike)
      expect(docking_station.release_bike).to be_a Bike
    end
  end

  describe "2. So that I can use a good bike," do
    it "I'd like to see if a bike is working" do
      docking_station.dock(bike)
      expect(docking_station.release_bike).not_to be_broken
    end
  end

  describe "3. So I can return bikes I've hired" do
    it "I want to dock my bike at the docking station" do
      expect(docking_station.dock(bike)).to include bike
    end
  end

  # describe "4. So I can decide whether to use the docking station" do
  #   it "I want to see a bike that has been docked" do
  #     docking_station.dock(bike)
  #     expect(docking_station.bikes).to include bike
  #   end
  # end

  describe "5. So that I am not confused and charged unnecessarily," do
    it "I'd like docking stations not to release bikes when none available." do
      expect { docking_station.release_bike }.to raise_error("No bike available")
    end
  end

  describe "6. So that I can control the distribution of bikes," do
    it "I'd like docking stations not to accept more bikes than capacity." do
      DockingStation::DEFAULT_CAPACITY.times { docking_station.dock(bike) }
      expect { docking_station.dock(bike) }.to raise_error("DockingStation full")
    end
  end

  describe "7. So that I can plan the distribution of bikes," do
    it "I want a docking station to have a default capacity of 20 bikes." do
      expect(DockingStation::DEFAULT_CAPACITY).to eq 20
    end
  end

  describe "8. So that busy areas can be served more effectively," do
    it "I want to be able to specify a larger capacity when necessary." do
      expect(docking_station.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end

  describe "9. So that I reduce the chance of getting a broken bike in future," do
    it "I'd like to report a bike as broken when I return it." do
      bike.report_broken
      expect(bike).to be_broken
    end
  end

  describe "10. So that I can manage broken bikes and not disappoint users," do
    it "I'd like docking stations not to release broken bikes." do
      bike.report_broken
      docking_station.dock(bike)
      expect { docking_station.release_bike }.to raise_error "No bike available"
    end
  end

  describe "11. So that I can manage broken bikes and not disappoint users," do
    it "I'd like docking stations to accept returning bikes (broken or not)." do
      bike.report_broken
      expect(docking_station.dock(bike)).to include bike
    end
  end

  describe "12. So that I can manage broken bikes and not disappoint users," do
    before :each do
      bike.report_broken
    end

    it "I'd like vans to take broken bikes from docking stations," do
      expect(van.take_broken(bike)).to include bike
    end

    it "and deliver them to garages to be fixed." do
      van.take_broken(bike)
      expect(garage.accept_broken(van.deliver_broken_bike)).to include bike
    end
  end

  describe "13. So that I can manage broken bikes and not disappoint users," do
    it "I'd like garages to provide working bikes" do
      bike.report_broken
      garage.accept_broken(bike)
      garage.fix_bikes
      expect(garage.return_working_bike.broken?).to eq false
    end

    it "I'd like vans to collect working bikes from garages" do
      bike.report_broken
      garage.accept_broken(bike)
      garage.fix_bikes
      expect(van.collect_working( garage.return_working_bike )).to include bike
    end

    it "I'd like vans to distribute working bikes to docking stations." do
      van.collect_working(bike)
      expect(van.distribute_working_bike).to eq bike
    end
  end
end
