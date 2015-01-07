require 'spec_helper'

describe OmniAuth::Strategies::Kosynierzy do
  let(:request) { double('Request', params: {}, cookies: {}, env: {}) }

  subject do
    args = ['appid', 'secret', @options || {}].compact
    OmniAuth::Strategies::Kosynierzy.new(*args).tap do |strategy|
      strategy.stub(:request) {
        request
      }
    end
  end

  describe 'client options' do
    describe 'name' do
      it { expect(subject.options.name).to eq(:kosynierzy) }
    end

    describe 'site' do
      it { expect(subject.options.client_options.site).to eq('https://account.kosynierzy.info') }
    end

    describe 'authorize_url' do
      it { expect(subject.options.client_options.authorize_url).to eq('/oauth/authorize') }
    end
  end

  describe '#info' do
    before(:each) do
      subject.stub(:raw_info) { {} }
    end

    it { expect(subject.info).to have_key(:email) }
    it { expect(subject.info).to have_key(:username) }
    it { expect(subject.info).to have_key(:roles) }
  end
end
