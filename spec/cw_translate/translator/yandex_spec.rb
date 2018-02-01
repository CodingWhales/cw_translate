require 'spec_helper'

RSpec.describe CwTranslate::Translators::Yandex do
  subject { described_class.new('api key') }

  describe '#translate' do
    it 'translates using Yandex API successfully' do
      expect_any_instance_of(::Yandex::Translator).to receive(:translate)
        .with('hello', {to: 'de', from: 'en'}) { 'hallo' }
      expect(subject.translate('hello', 'de', 'en')).to eq 'hallo'
    end

    context 'even without source lang' do
      it 'translates using Yandex API successfully' do
        expect_any_instance_of(::Yandex::Translator).to receive(:translate)
          .with('hello', {to: 'de', from: nil}) { 'hallo' }
        expect(subject.translate('hello', 'de')).to eq 'hallo'
      end
    end
  end
end
