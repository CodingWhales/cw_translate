require 'cw_translate/version'
require 'cw_translate/cache'
require 'cw_translate/translator'
require 'cw_translate/cli'

module CwTranslate
  DEFAULT_OPTIONS = { from: nil, translator: nil, no_cache: false }.freeze
  DEFAULT_FROM = 'en'.freeze

  def self.cache(_cache_name = nil)
    throw 'Not Implemented'
  end

  def self.translator(_translator_name = nil)
    throw 'Not Implemented'
  end

  def self.translate(text, to, from = DEFAULT_FROM, opts = {})
    _opts = DEFAULT_OPTIONS.merge(opts)
    cache = self.cache
    translator = self.translator

    translation = cache.lookup_cache(text, to, from)
    unless translation
      translation = translator.translate(text, to, from)
      cache.update_cache(text, to, from, translation)
    end

    translation
  end
end
