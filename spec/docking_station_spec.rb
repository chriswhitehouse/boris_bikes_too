describe DockingStation do
  describe '#release_bike' do
    it 'should respond with a bike object' do
      expect(subject).to respond_to(:release_bike)
    end
  end
end
