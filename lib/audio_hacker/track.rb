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

    def to_transcode_option
      "-ss #{@start.to_s} -t #{@duration.to_s}"
    end
  end
end
