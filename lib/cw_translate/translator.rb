module CwTranslate
  # @abstarct Translator API
  class Translator
    # @param text [String] Source text to translate
    # @param to [String, Symbol] Target language (in ISO 639-1/639-2 Code)
    # @param from [String, Sybmo] Source language (in ISO 639-1/639-2 Code)
    def translate(_text, _to, _from = nil)
      throw 'Not Implemented'
    end
  end
end
