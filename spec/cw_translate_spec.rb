require 'spec_helper'

RSpec.describe CwTranslate do
  it 'has a version number' do
    expect(CwTranslate::VERSION).not_to be nil
  end

  describe '.translate' do
    subject { described_class.translate(*args) }
    context 'mandatory arguments' do
      let(:args) { %w[hello de] }
      let(:translation) { 'hallo' }
      let(:cache) { CwTranslate::Cache.new }
      let(:translator) { CwTranslate::Translator.new }
      let(:cache_translation) { nil }

      before do
        allow(described_class).to receive(:cache) { cache }
        allow(described_class).to receive(:translator) { translator }

        allow(cache).to receive(:lookup_cache) { cache_translation }
        allow(cache).to receive(:update_cache)
        allow(translator).to receive(:translate) { translation }
      end

      it 'initializes and calls default cache and default translator correctly' do
        expect(described_class).to receive(:cache).with(no_args)
        expect(described_class).to receive(:translator).with(no_args)

        expect(cache).to receive(:lookup_cache).with('hello', 'de', described_class::DEFAULT_FROM)
        expect(translator).to receive(:translate).with('hello', 'de', described_class::DEFAULT_FROM)
        expect(cache).to receive(:update_cache).with('hello', 'de', described_class::DEFAULT_FROM, 'hallo')

        expect(subject).to eq('hallo')
      end

      context 'translation is cached' do
        let(:cache_translation) { translation }

        it 'does not call translator.translate and return from cache' do
          expect(cache).to receive(:lookup_cache).with('hello', 'de', described_class::DEFAULT_FROM)
          expect(translator).not_to receive(:translate)

          expect(subject).to eq('hallo')
        end
      end
    end
  end
end
