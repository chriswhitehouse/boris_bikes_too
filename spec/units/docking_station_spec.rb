require 'support/shared_examples_for_bike_container'

describe DockingStation do
  it_behaves_like BikeContainer

  let(:bike) { double :bike, report_broken: true, broken?: false }

  describe "#release_bike" do
    it "releases working bikes when one is available" do
      subject.dock(bike)
      expect(subject.release_bike).not_to be_broken
    end

    it "raises an error when no bikes are available" do
      expect { subject.release_bike }.to raise_error "No bike available"
    end

    it "raises an error when no working bikes are available" do
      allow(bike).to receive(:broken?).and_return(true)
      bike.report_broken
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error "No bike available"
    end
  end

  describe "#dock" do
    it "docks a bike" do
      expect(subject.dock(bike)).to include bike
    end

    it "raises an error when docking station is full" do
      subject.capacity.times { subject.dock(bike) }
      expect { subject.dock(bike) }.to raise_error "DockingStation full"
    end
  end

end
