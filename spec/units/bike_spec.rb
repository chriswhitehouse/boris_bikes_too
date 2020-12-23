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

  describe "#fix" do
    it "should respond to fix" do
      expect(subject).to respond_to(:fix)
    end

    it "should change broken from true to false" do
      subject.report_broken
      subject.fix
      expect(subject.broken?).to eq false
    end
  end
end
