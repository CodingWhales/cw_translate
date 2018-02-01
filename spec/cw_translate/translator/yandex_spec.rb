require 'spec_helper'

RSpec.describe CwTranslate::Translators::Yandex do
  subject { described_class.new(api_key) }

  describe 'translate' do
    let(:api_key) { 'trnsl.1.1.20180201T220541Z.724d88857d55d6c7.43333fca2cd94b06c9f4835618370e64ad406848' }

    describe '#translate' do
      it 'translates using Yandex API successfully' do
        expect { subject.translate('hello', 'ru', 'en') }.not_to raise_error
      end

      context 'even without source lang' do
        it 'translates using Yandex API successfully' do
          expect { subject.translate('hello', 'ru') }.not_to raise_error
        end
      end
    end
  end
end
