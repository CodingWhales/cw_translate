module CwTranslate
  class CLI
    def initialize(options)
      @text = options[:_].first
      @options = options.tap { |opt| opt.delete(:_) }

      CwTranslate.translate(@text, @options[:to])
    end
  end
end
