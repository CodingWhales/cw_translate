require "cw_translate/version"
require "cw_translate/cache"
require "cw_translate/translator"

module CwTranslate
  DEFAULT_FROM = 'en'.freeze
  DEFAULT_OPTIONS = {from: DEFAULT_FROM, translator: nil, no_cache: false}.freeze

  def self.cache(cache_name = nil)
    throw 'Not Implemented'
  end

  def self.translator(translator_name = nil)
    throw 'Not Implemented'
  end

  def self.translate(text, to, opts = {})
    opts = DEFAULT_OPTIONS.merge(opts)
    cache = self.cache
    translator = self.translator

    unless translation = cache.lookupCache(text, to, opts[:from])
      translation = translator.translate(text, to, opts[:from])
      cache.updateCache(text, to, opts[:from], translation)
    end

    translation
  end
end
