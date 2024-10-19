require 'dotenv/load'

EasyBroker.configure do |config|
  config.api_root_url = EasyBroker::STAGING_API_ROOT_URL
  config.api_key = ENV['API_KEY']
  config.country_code = 'MX'
end
