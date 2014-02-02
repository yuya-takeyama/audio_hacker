describe AudioHacker::Dsl do
  let(:dsl) { ::AudioHacker::Dsl.new }

  context 'by default' do
    it 'should have no albums' do
      expect(dsl.albums).to be_empty
    end
  end

  context 'when an album is added' do
    before do
      dsl.album '1st album'
    end

    it 'should have 1 album' do
      expect(dsl.albums).to have(1).item
    end

    it 'should have correct album title' do
      expect(dsl.albums[0].title).to eq('1st album')
    end
  end

  context 'when 3 albums are added' do
    before do
      dsl.album '1st album'
      dsl.album '2nd album'
      dsl.album '3rd album'
    end

    it 'should have 3 albums' do
      expect(dsl.albums).to have(3).items
    end

    it 'should have correct album titles' do
      expect(dsl.albums[0].title).to eq('1st album')
      expect(dsl.albums[1].title).to eq('2nd album')
      expect(dsl.albums[2].title).to eq('3rd album')
    end
  end
end
