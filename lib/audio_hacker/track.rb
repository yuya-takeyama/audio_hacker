module AudioHacker
  class Track
    attr_accessor :title, :directory, :file, :start, :duration, :track_number

    def initialize
      @directory = 1
      @file = 1
    end
  end
end
