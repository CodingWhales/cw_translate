require 'spec_helper'

RSpec.describe CwTranslate::Translate do
  describe '#initialize' do
    subject { described_class.new(*args) }
    let(:args) { %w[source target translator cache] }

    it do
      is_expected.to have_attributes(
        source: 'source',
        target: 'target',
        translator: 'translator',
        cache: 'cache'
      )
    end
  end

  describe '#translate' do
    subject do
      described_class
        .new(source, target, translator, cache)
        .translate(text, use_cache)
    end
    let(:source) { 'en' }
    let(:target) { 'de' }
    let(:translator) { double(CwTranslate::Translator) }
    let(:cache) { double(CwTranslate::Cache) }
    let(:text) { 'hello' }
    let(:translation) { 'hallo' }
    let(:use_cache) { true }
    let(:cached) { false }

    before do
      allow(translator).to receive(:translate) { translation }
      allow(cache).to receive(:lookup_cache) { cached && translation }
      allow(cache).to receive(:update_cache)
    end

    it 'it hits the cache, translates using translator and updates cache' do
      expect(cache).to receive(:lookup_cache)
        .with(text, target, source)
      expect(translator).to receive(:translate)
        .with(text, target, source)
      expect(cache).to receive(:update_cache)
        .with(text, target, source, translation)

      subject
    end

    context 'not using cache' do
      let(:use_cache) { false }

      it 'does not hit nor updates the cache' do
        expect(cache).not_to receive(:lookup_cache)
        expect(translator).to receive(:translate)
          .with(text, target, source)
        expect(cache).not_to receive(:update_cache)

        subject
      end
    end

    context 'cached translation' do
      let(:cached) { true }
      it 'hits cache and return cached translation without further action' do
        expect(cache).to receive(:lookup_cache)
          .with(text, target, source)
        expect(translator).not_to receive(:translate)
        expect(cache).not_to receive(:update_cache)

        subject
      end

      context 'not using cache' do
        let(:use_cache) { false }

        it 'does not hit nor updates the cache' do
          expect(cache).not_to receive(:lookup_cache)
          expect(translator).to receive(:translate)
            .with(text, target, source)
          expect(cache).not_to receive(:update_cache)

          subject
        end
      end
    end
  end
end
