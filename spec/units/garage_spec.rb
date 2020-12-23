describe Garage do
  let(:bike_double) { double :bike }

  describe "#accept_broken" do
    # allow(bike_double).to receive(:broken?).and_return(false)
    it "should respond" do
      expect(subject).to respond_to(:accept_broken)
    end

    it "should respond with one argurment given" do
      expect(subject).to respond_to(:accept_broken).with(1).argument
    end

    it "should store an instance of a broken bike" do
      allow(bike_double).to receive(:broken?).and_return(true)
      allow(bike_double).to receive(:fix)
      expect(subject.accept_broken(bike_double)).to include bike_double
    end

    it "should not store an instance of a broken bike" do
      allow(bike_double).to receive(:broken?).and_return(false)
      expect { subject.accept_broken(bike_double) }.to raise_error("Will not accept working bikes")
    end
  end

  describe "#return_working_bike" do
    it 'should respond' do
      expect(subject).to respond_to(:return_working_bike)
    end

    it 'should return a bike' do
      allow(bike_double).to receive(:broken?).and_return(true)
      allow(bike_double).to receive(:fix)
      subject.accept_broken(bike_double)
      # allow(bike_double).to receive(:broken?).and_return(false)
      expect(subject.return_working_bike).to eq bike_double
    end
  #
    it 'should return a working bike' do
      allow(bike_double).to receive(:broken?).and_return(true)
      allow(bike_double).to receive(:fix)
      subject.accept_broken(bike_double)
      allow(bike_double).to receive(:broken?).and_return(false)
      expect(subject.return_working_bike.broken?).to eq false
    end
  end
end
