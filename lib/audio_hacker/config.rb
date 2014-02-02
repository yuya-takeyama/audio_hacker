module AudioHacker
  class Config
    attr_reader :directory_definitions

    def initialize(config_hash = {})
      @directory_definitions = config_hash[:directory_definitions]
    end

    def self.load(yml_config_hash)
      config = {}
      pattern = yml_config_hash['pattern'] if yml_config_hash['pattern']

      if yml_config_hash['dir']
        config[:directory_definitions] = yml_config_hash['dir'].map do |path|
          DirectoryDefinition.new(path, pattern)
        end
      end

      self.new(config)
    end
  end
end
