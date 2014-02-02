describe AudioHacker::Track do
  context 'by default' do
    let(:track) { ::AudioHacker::Track.new }

    describe '#file' do
      subject { track.file }

      it 'should be 1' do
        expect(subject).to be(1)
      end
    end

    describe '#directory' do
      subject { track.directory }

      it 'should be 1' do
        expect(subject).to be(1)
      end
    end
  end
end
