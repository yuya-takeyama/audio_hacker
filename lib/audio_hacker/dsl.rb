module AudioHacker
  class Dsl
    attr_reader :albums

    def initialize
      @albums = []
    end

    def self.load(file)
      dsl_script = ::File.read(file)
      dsl_script.force_encoding('utf-8')
      dsl_script.sub!(/^__END__\n.*\Z/m, '')

      self.load_from_string(dsl_script, file)
    end

    def self.load_from_string(dsl_script, file)
      dsl = self.new

      eval "dsl.parse {\n" + dsl_script + "\n}", binding, file, 0
    end

    def parse(&block)
      instance_eval &block

      self
    end

    def album(title = nil, &block)
      add_album(title)

      instance_eval(&block)
    end

    def track(title = nil, &block)
      add_track(title)

      instance_eval(&block)
    end

    [:directory, :file, :start, :duration].each do |method|
      class_eval "def #{method}(v); @current_track.#{method} = v; end"
    end

    alias :dir :directory

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
