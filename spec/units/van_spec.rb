describe Van do
  let(:bike_double) { double :bike }

  describe "#take_broken" do
    it 'should not accept a working bike' do
      allow(bike_double).to receive(:broken?).and_return(false)
      expect { subject.take_broken(bike_double) }.to raise_error "Will not take working bike"
    end

    it 'should accept a broken bike' do
      allow(bike_double).to receive(:broken?).and_return(true)
      subject.take_broken(bike_double)
      expect(subject.broken_bikes).to include bike_double
    end
  end

  describe "#deliver__broken_bike" do
    it 'should return a broken bike' do
      allow(bike_double).to receive(:broken?).and_return(true)
      subject.take_broken(bike_double)
      expect(subject.deliver_broken_bike).to eq bike_double
    end
  end
end
