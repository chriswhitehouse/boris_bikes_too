describe Bike do
  describe "#report_broken" do
    it "can be reported broken" do
      subject.report_broken
      expect(subject).to be_broken
    end
  end

  describe "#broken?" do
    it "should respond to broken?" do
      expect(subject).to respond_to(:broken?)
    end
  end
end
