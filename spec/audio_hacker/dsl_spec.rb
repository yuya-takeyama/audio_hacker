describe AudioHacker::Dsl do
  let(:dsl) { ::AudioHacker::Dsl.new }

  context 'by default' do
    it 'should have no albums' do
      expect(dsl.albums).to be_empty
    end
  end

  context 'when an album and a track is added' do
    before do
      dsl.album '1st album' do
        track '1st track' do
          directory 2
          file 3
          start 4
          duration 5
        end
      end
    end

    it 'should have 1 album' do
      expect(dsl.albums).to have(1).track
    end

    it 'should have correct album title' do
      expect(dsl.albums[0].title).to eq('1st album')
    end

    describe 'its album' do
      subject(:album) { dsl.albums[0] }

      it 'should have 1 track' do
        expect(album).to have(1).tracks
      end

      describe 'its track' do
        let(:track) { album.tracks[0] }

        it 'should have correct attributes' do
          expect(track.title).to eq('1st track')
          expect(track.directory).to eq(2)
          expect(track.file).to eq(3)
          expect(track.start).to eq(4)
          expect(track.duration).to eq(5)
        end
      end
    end
  end

  context 'when 3 albums are added and 3 tracks is added for last album' do
    before do
      dsl.album '1st album' do
      end

      dsl.album '2nd album' do
      end

      dsl.album '3rd album' do
        track '1st track' do
          start 3
          duration 4
        end

        track '2nd track' do
          start 5
          duration 6
        end

        track '3rd track' do
          start 7
          duration 8
        end
      end
    end

    it 'should have 3 albums' do
      expect(dsl).to have(3).albums
    end

    it 'should have correct album titles' do
      expect(dsl.albums[0].title).to eq('1st album')
      expect(dsl.albums[1].title).to eq('2nd album')
      expect(dsl.albums[2].title).to eq('3rd album')
    end

    describe 'its last album' do
      let(:last_album) { dsl.albums[2] }

      it 'should have 3 tracks' do
        expect(last_album).to have(3).tracks
      end

      describe 'its tracks' do
        let(:tracks) { last_album.tracks }

        it 'should have correct attributes' do
          expect(tracks[0].title).to eq('1st track')
          expect(tracks[0].start).to eq(3)
          expect(tracks[0].duration).to eq(4)
          expect(tracks[1].title).to eq('2nd track')
          expect(tracks[1].start).to eq(5)
          expect(tracks[1].duration).to eq(6)
          expect(tracks[2].title).to eq('3rd track')
          expect(tracks[2].start).to eq(7)
          expect(tracks[2].duration).to eq(8)
        end
      end
    end
  end
end
