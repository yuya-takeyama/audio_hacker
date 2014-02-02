module AudioHacker
  class Track
    attr_accessor :title, :directory, :file, :start, :duration, :track_number

    def initialize
      @directory = 1
      @file = 1
    end

    def to_output_file(config, input_file)
      File.join(config.output_dir, @title + File.extname(input_file))
    end

    def to_ffmpeg_option
      options = {}

      options['ss'] = @start.to_s if @start
      options['t'] = @duration.to_s if @duration

      options.map { |key, value|"-#{key} #{value}" }.join(' ')
    end
  end
end
