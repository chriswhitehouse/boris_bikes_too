require 'support/shared_examples_for_bike_container'

describe Garage do
  it_behaves_like BikeContainer

  let(:bike_double) { double :bike }

  describe "#accept_broken" do
    it "should store an instance of a broken bike" do
      allow(bike_double).to receive(:broken?).and_return(true)
      allow(bike_double).to receive(:fix)
      expect(subject.accept_broken(bike_double)).to include bike_double
    end

    it "should not store an instance of a working bike" do
      allow(bike_double).to receive(:broken?).and_return(false)
      expect { subject.accept_broken(bike_double) }.to raise_error("Will not accept working bikes")
    end
  end

  describe "#return_working_bike" do
    it 'should return a working bike' do
      allow(bike_double).to receive(:broken?).and_return(true)
      allow(bike_double).to receive(:fix)
      subject.accept_broken(bike_double)
      allow(bike_double).to receive(:broken?).and_return(false)
      expect(subject.return_working_bike.broken?).to eq false
    end
  end

  describe "#fix_bikes" do
    it 'fixes all broken bikes' do
      bike = double :bike
      subject.add bike
      expect(bike).to receive :fix
      subject.fix_bikes
    end
  end
end
