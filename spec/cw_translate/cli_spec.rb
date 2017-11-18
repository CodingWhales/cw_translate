require 'spec_helper'

RSpec.describe CwTranslate::CLI do
  subject { described_class.new(args) }

  describe 'text and to argument are given' do
    let(:args) { { _: ['hallo'], to: 'en' } }

    it 'calls CwTranslate.translate with correct arguments' do
      expect(CwTranslate).to receive(:translate).with('hallo', 'en')
      subject
    end
  end
end
