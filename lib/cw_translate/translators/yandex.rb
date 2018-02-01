require('yandex-translator')

module CwTranslate
  module Translators
    class Yandex < CwTranslate::Translator
      def initialize(api_key)
        @translator = ::Yandex::Translator.new(api_key)
      end

      attr_reader :translator

      def translate(text, to, from = nil)
        translator.translate text, from: from, to: to
      end
    end
  end
end
