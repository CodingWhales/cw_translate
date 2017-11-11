require 'yaml'

module CwTranslate
  class Config
    # @param config_file_path [String] path to configuration yml. Default (see #find_config_file)
    # @return [CwTranslate::Config]
    def self.load(config_file_path = find_config_file)
    end

    # Find configuration file following this order:
    # 1. Execution path of script
    # 2. Rails root if Rails is in environment
    # 3. "~/.cw_translate/config.yml"
    # 4. "/etc/cw_translate/config.yml"
    # @return [String] absolute path to closest configuration file
    def self.find_config_file
    end
  end
end
