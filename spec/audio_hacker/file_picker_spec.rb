describe AudioHacker::FilePicker do
  describe '#pick' do
    let(:file_picker) { ::AudioHacker::FilePicker.new }
    let(:directory_definitions) do
      definition1 = double('definition1')
      definition1.stub(:files).and_return([
        '/dir1/file1.m4a',
        '/dir1/file2.m4a',
        '/dir1/file3.m4a',
      ])

      definition2 = double('definition2')
      definition2.stub(:files).and_return([
        '/dir2/file1.m4a',
        '/dir2/file2.m4a',
        '/dir2/file3.m4a',
      ])

      definition3 = double('definition3')
      definition3.stub(:files).and_return([
        '/dir3/file1.m4a',
        '/dir3/file2.m4a',
        '/dir3/file3.m4a',
      ])

      [definition1, definition2, definition3]
    end
    let(:track) do
      track = ::AudioHacker::Track.new
      track.directory = directory
      track.file = file
      track
    end
    subject { file_picker.pick(directory_definitions, track) }

    context 'when directory is 1 and file is 3' do
      let(:directory) { 1 }
      let(:file) { 3 }

      it 'should be correct file' do
        expect(subject).to eq('/dir1/file3.m4a')
      end
    end

    context 'when directory is 3 and file is 1' do
      let(:directory) { 3 }
      let(:file) { 1 }

      it 'should be correct file' do
        expect(subject).to eq('/dir3/file1.m4a')
      end
    end
  end
end
