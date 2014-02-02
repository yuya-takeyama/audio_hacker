module AudioHacker
  class Cli < ::Thor
    desc 'exec DSL_FILES', 'execute AudioHacker DSL files'
    option :config, default: './config.yml'
    def exec(*files)
      raise 'Config file is not found' unless File.exist? options[:config]
      raise 'No DSL files are specified' if files.size == 0

      config = Config.load_yml(options[:config])
      picker = FilePicker.new

      files.each do |file|
        puts "Executing " + file + "..."

        Dsl.load(file).albums.each do |album|
          album.tracks.each do |track|
            input_file = picker.pick(config.directory_definitions, track)
            FFMPEG::Movie.new(input_file).transcode(track.to_output_file(config, input_file), track.to_ffmpeg_option)
          end
        end
      end

      puts "Finished!"
    end
  end
end
