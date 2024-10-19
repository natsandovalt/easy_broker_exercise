require 'logger'

module Broker
  class ApiClient
    def initialize
      @client = EasyBroker.client
      @logger = Logger.new($stdout)
    end

    def fetch_properties
      logger.info("Fetching properties...")
      client.properties.search
    end

    private

    attr_reader :client
    attr_reader :logger
  end
end
