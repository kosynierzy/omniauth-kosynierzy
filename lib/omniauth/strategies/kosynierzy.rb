require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Kosynierzy < OmniAuth::Strategies::OAuth2
      option :name, :kosynierzy

      option :client_options, {
        site: ENV.fetch('ACCOUNT_KOSYNIERZY_HOST') { 'http://account.kosynierzy.info' },
        authorize_url: '/oauth/authorize'
      }

      uid { raw_info['id'] }

      info do
        {
          email: raw_info[:email]
        }
      end

      def raw_info
        @raw_info ||= access_toke.get('/api/v1/me.json').parsed
      end
    end
  end
end
