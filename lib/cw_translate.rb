require "cw_translate/version"
require "cw_translate/cache"
require "cw_translate/translator"

module CwTranslate
  DEFAULT_OPTIONS = {from: nil, translator: nil, no_cache: false}.freeze
  DEFAULT_FROM = 'en'

  def self.cache(cache_name = nil)
    throw 'Not Implemented'
  end

  def self.translator(translator_name = nil)
    throw 'Not Implemented'
  end

  def self.translate(text, to, from = DEFAULT_FROM, opts = {})
    opts = DEFAULT_OPTIONS.merge(opts)
    cache = self.cache
    translator = self.translator

    translation = cache.lookupCache(text, to, from)
    unless translation
      translation = translator.translate(text, to, from)
      cache.updateCache(text, to, from, translation)
    end

    translation
  end
end
