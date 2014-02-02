module AudioHacker
  class DirectoryDefinition
    attr_reader :path, :pattern

    def initialize(path, pattern)
      @path = path
      @pattern = pattern
    end

    def files
      @loaded_files ||= load_files
    end

    private
      def load_files
        files = []

        Dir.chdir(@path) do
          files = Dir.glob(@pattern).map do |file|
            File.join(@path, file)
          end
        end

        files
      end
  end
end
