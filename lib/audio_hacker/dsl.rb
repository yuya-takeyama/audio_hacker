module AudioHacker
  class Dsl
    attr_reader :albums

    def initialize
      @albums = []
    end

    def self.parse(&block)
      self.new.instance_eval(&block)
    end

    def album(title = nil, &block)
      add_album(title)

      instance_eval(&block)
    end

    def track(title = nil, &block)
      add_track(title)

      instance_eval(&block)
    end

    def start(start)
      @current_track.start = start
    end

    def duration(duration)
      @current_track.duration = duration
    end

    private
      def add_album(title = nil)
        new_album = Album.new
        new_album.title = title if title
        @albums << new_album
        @current_album = new_album
      end

      def add_track(title = nil)
        new_track = Track.new
        new_track.title = title if title
        @current_album.tracks << new_track
        @current_track = new_track
      end
  end
end
