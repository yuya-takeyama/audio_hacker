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

  describe '#to_ffmpeg_option' do
    subject { track.to_ffmpeg_option }

    context 'when no start and duration is specified' do
      let(:track) { AudioHacker::Track.new }

      it 'should be empty string' do
        expect(subject).to eq('')
      end
    end

    context 'when only start is specified' do
      let(:track) do
        track = AudioHacker::Track.new
        track.start = 42
        track
      end

      it 'should be correct option' do
        expect(subject).to eq('-ss 42')
      end
    end

    context 'when only start is specified' do
      let(:track) do
        track = AudioHacker::Track.new
        track.duration = 42
        track
      end

      it 'should be correct option' do
        expect(subject).to eq('-t 42')
      end
    end

    context 'when both start and duration are specified' do
      let(:track) do
        track = AudioHacker::Track.new
        track.start = 42
        track.duration = 43
        track
      end

      it 'should be correct option' do
        expect(subject).to eq('-ss 42 -t 43')
      end
    end
  end
end
