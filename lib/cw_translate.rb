require "cw_translate/version"
require "cw_translate/cache"
require "cw_translate/translator"

module CwTranslate
  # @param config [CwTranslate::Config]
  def self.initTranslate(config)
    config ||= Config.load
    Translate.new(config.source, config.target, config.translator, config.cache)
  end
end
