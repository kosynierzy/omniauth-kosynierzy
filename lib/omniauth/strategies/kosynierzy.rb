require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Kosynierzy < OmniAuth::Strategies::OAuth2
      option :name, :kosynierzy

      option :client_options, {
        site: ENV.fetch('ACCOUNT_KOSYNIERZY_HOST') { 'https://account.kosynierzy.info' },
        authorize_url: '/oauth/authorize'
      }

      uid { raw_info['id'] }

      info do
        {
          email: raw_info['email'],
          username: raw_info['username'],
          roles: raw_info['roles'],
          firstname: raw_info['firstname'],
          lastname: raw_info['lastname'],
          personal_identity_number: raw_info['personal_identity_number'],
          identity_card_number: raw_info['identity_card_number'],
          phone_number: raw_info['phone_number'],
          address: raw_info['address']
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/me.json').parsed
      end
    end
  end
end
