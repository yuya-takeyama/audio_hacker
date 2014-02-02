describe AudioHacker::Config do
  let(:config) { ::AudioHacker::Config.load(yml_config_hash) }

  describe '.load' do
    subject { config }

    context 'with pattern and dir as array of string' do
      let(:yml_config_hash) do
        {
          "pattern" => "*.m4a",
          "dir" => [
            "/path/to/dir1",
            "/path/to/dir2",
            "/path/to/dir3",
          ]
        }
      end

      it 'should be correct config' do
        expect(config.directory_definitions[0].path).to eq('/path/to/dir1')
        expect(config.directory_definitions[1].path).to eq('/path/to/dir2')
        expect(config.directory_definitions[2].path).to eq('/path/to/dir3')

        expect(config.directory_definitions[0].pattern).to eq('*.m4a')
        expect(config.directory_definitions[1].pattern).to eq('*.m4a')
        expect(config.directory_definitions[2].pattern).to eq('*.m4a')
      end
    end
  end
end
