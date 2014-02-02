module AudioHacker
  class Dsl
    attr_reader :albums

    def initialize
      @albums = []
    end

    def album(title = nil)
      add_album(title)
    end

    private
      def add_album(title = nil)
        new_album = Album.new
        new_album.title = title if title
        @albums << new_album
      end
  end
end
