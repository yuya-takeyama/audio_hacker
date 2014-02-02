module AudioHacker
  class DirectoryDefinition
    attr_reader :path, :pattern

    def initialize(path, pattern)
      @path = path
      @pattern = pattern
    end
  end
end
