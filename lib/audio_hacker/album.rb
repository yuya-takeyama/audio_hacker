module AudioHacker
  class Album
    attr_accessor :title, :tracks

    def initialize
      @tracks = []
    end
  end
end
