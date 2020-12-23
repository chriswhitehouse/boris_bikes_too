require 'support/shared_examples_for_bike_container'

describe Van do
  it_behaves_like BikeContainer

  let(:bike_double) { double :bike }

  describe "#take_broken" do
    it "should not accept a working bike" do
      allow(bike_double).to receive(:broken?).and_return(false)
      expect { subject.take_broken(bike_double) }.to raise_error "Will not take working bike"
    end

    it "should accept a broken bike" do
      allow(bike_double).to receive(:broken?).and_return(true)
      subject.take_broken(bike_double)
      expect(subject.take_broken(bike_double)).to include bike_double
    end
  end

  describe "#deliver__broken_bike" do
    it "should return a broken bike" do
      allow(bike_double).to receive(:broken?).and_return(true)
      subject.take_broken(bike_double)
      expect(subject.deliver_broken_bike).to eq bike_double
    end
  end

  describe "#collect_working" do
    it "should store a working bike in a collection" do
      allow(bike_double).to receive(:broken?).and_return(false)
      expect(subject.collect_working(bike_double)).to include bike_double
    end
  end

  describe "#distribute_working_bike" do
    it "should return a bike" do
      allow(bike_double).to receive(:broken?).and_return(false)
      subject.collect_working(bike_double)
      expect(subject.distribute_working_bike).to eq bike_double
    end
  end
end
