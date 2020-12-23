describe Van do
  let(:bike_double) { double :bike }

  describe "#take_broken" do
    it "should not accept a working bike" do
      allow(bike_double).to receive(:broken?).and_return(false)
      expect { subject.take_broken(bike_double) }.to raise_error "Will not take working bike"
    end

    it "should accept a broken bike" do
      allow(bike_double).to receive(:broken?).and_return(true)
      subject.take_broken(bike_double)
      expect(subject.broken_bikes).to include bike_double
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
    it "should respond" do
      expect(subject).to respond_to(:collect_working)
    end

    it "should store a working bike in a collection" do
      expect(subject.collect_working(bike_double)).to include bike_double
    end
  end

  describe "#distribute_working_bike" do
    it "should respond" do
      expect(subject).to respond_to(:distribute_working_bike)
    end

    it "should return a bike" do
      subject.collect_working(bike_double)
      expect(subject.distribute_working_bike).to eq bike_double
    end
  end
end
