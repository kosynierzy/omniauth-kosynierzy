$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'omniauth-kosynierzy'

RSpec.configure do |config|
  config.order = 'random'
end
