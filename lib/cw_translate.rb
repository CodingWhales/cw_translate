require 'cw_translate/cache'
require 'cw_translate/translator'
require 'cw_translate/cli'

module CwTranslate
  # @param config [CwTranslate::Config] optional. default load mechanism is ueed if config is not passed.
  # See CwTranslate::Config.load
  def self.init_translate(config = nil)
    config ||= Config.load
    Translate.new(config.source, config.target, config.translator, config.cache)
  end
end
