module CwTranslate
  # @abstract Cache API
  class Cache

    # @abstract Looks up the cache for a translation for given text/to/from
    # @param text [String] Srouce text of translation
    # @param to [String, Symbol] Target language (in ISO 639-1/639-2 Code)
    # @param from [String, Sybmo] Source language (in ISO 639-1/639-2 Code)
    def lookupCache(text, to, from)
      throw 'Not Implemented'
    end

    # @abstract Updates the cache with a translation for given text/to/from
    # @param text [String] Srouce text of translation
    # @param to [String, Symbol] Target language (in ISO 639-1/639-2 Code)
    # @param from [String, Sybmo] Source language (in ISO 639-1/639-2 Code)
    # @param translation [String] Translation result for given text/to/from params. Use nil to clear the entry.
    def updateCache(text, to, from, translation)
      throw 'Not Implemented'
    end

    # @abstract Clears the entire cache. Calls to #lookupCache after a call to #clearCache
    # must return nil until same combination being updated again using #updateCache
    def clearCache(from: nil, to: nil)
      throw 'Not Implemented'
    end
  end
end
