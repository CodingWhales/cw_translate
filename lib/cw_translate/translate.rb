module CwTranslate
  class Translate
    # @param source [String, Symbol] source language
    # @param target [String, Symbol] target language
    # @param translator [CwTranslate::Translator]
    # @param cache [CwTranslate::Cache]
    def initialize(source, target, translator, cache)
      @source = source
      @target = target
      @translator = translator
      @cache = cache
    end

    # @param text [String] text to translate
    # @param use_cache [Boolean] whether to use cache
    def translate(text, use_cache = true)
      translation(text, no_cache).tap do |translation|
        use_cache && @cache.updateCache(text, to, opts[:from], translation)
      end
    end

    attr_reader :source, :target, :translator, :cache

    private

    # @private
    def translation(text, use_cache)
      translation = use_cache && cache.lookupCache(text, to, opts[:from])
      translation || @translator.translate(text, to, opts[:from])
    end
  end
end
