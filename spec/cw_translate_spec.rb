require 'spec_helper'

RSpec.describe CwTranslate do
  it 'has a version number' do
    expect(CwTranslate::VERSION).not_to be nil
  end

  describe '.init_translate' do
    subject { described_class.init_translate(config) }
    before do
      allow(CwTranslate::Config).to receive(:load) { loadedConfig }
    end

    let(:loadedConfig) { double(:Config, source: 'ls', target: 'lt', translator: 'lr', cache: 'lc') }
    let(:config) { nil }

    it { is_expected.to have_attributes source: 'ls', target: 'lt', translator: 'lr', cache: 'lc' }

    context 'with config instance' do
      let(:config) { double(:Config, source: 'ps', target: 'pt', translator: 'pr', cache: 'pc') }

      it { is_expected.to have_attributes source: 'ps', target: 'pt', translator: 'pr', cache: 'pc' }
    end
  end
end
