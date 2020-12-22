require 'docking_station'
require 'bike'


describe 'User Stories' do
  let(:docking_station) { DockingStation.new }
  let(:bike) { Bike.new }

  describe "1. So that I can use a bike," do
    it "I'd like a docking station to release a bike." do
      docking_station.dock(bike)
      expect(docking_station.release_bike).to be_a Bike
    end
  end

  describe "2. So that I can use a good bike," do
    it "I'd like to see if a bike is working" do
      docking_station.dock(bike)
      expect(docking_station.release_bike).to be_working
    end
  end

  describe "3. So I can return bikes I've hired" do
    it "I want to dock my bike at the docking station" do
      expect(docking_station.dock(bike)).to eq bike
    end
  end

  describe "4. So I can decide whether to use the docking station" do
    it "I want to see a bike that has been docked" do
      docking_station.dock(bike)
      expect(docking_station.bike).to eq bike
    end
  end

  describe "5. So that I am not confused and charged unnecessarily," do
     it "I'd like docking stations not to release bikes when there are none available." do
      expect { docking_station.release_bike }.to raise_error("No bike available")
    end
  end

  describe "6. So that I can control the distribution of bikes," do
    it "I'd like docking stations not to accept more bikes than their capacity." do
      docking_station.dock(bike)
      expect { docking_station.dock(bike) }.to raise_error("Docking station full")
    end
  end
end
