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
      translation = use_cache && cache.lookup_cache(text, target, source)
      unless translation
        translation = translator.translate(text, target, source)
        use_cache && cache.update_cache(text, target, source, translation)
      end

      translation
    end

    attr_reader :source, :target, :translator, :cache
  end
end
