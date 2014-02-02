module AudioHacker
  class Config
    attr_reader :directory_definitions, :output_dir

    def initialize(config_hash = {})
      @directory_definitions = config_hash[:directory_definitions]
      @output_dir = config_hash[:output_dir]
    end

    def self.load(yml_config_hash)
      config = {}
      pattern = yml_config_hash['pattern'] if yml_config_hash['pattern']

      config[:output_dir] = yml_config_hash['output_dir'] if yml_config_hash['output_dir']

      if yml_config_hash['input_dir']
        config[:directory_definitions] = yml_config_hash['input_dir'].map do |path|
          DirectoryDefinition.new(path, pattern)
        end
      end

      self.new(config)
    end

    def self.load_yml(file)
      self.load(YAML.load(open(file)))
    end
  end
end
