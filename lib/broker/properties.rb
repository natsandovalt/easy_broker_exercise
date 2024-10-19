require_relative '../errors/format_not_supported'
require_relative '../output_generator'
require_relative 'api_client'
require 'logger'

module Broker
  class Properties
    class << self
      def run(format)
        format ||= 'txt'
        new(format).run
      end
    end

    FILENAME = 'properties'.freeze

    def initialize(format)
      @output_generator = OutputGenerator.new(format.to_sym)
      @client = ApiClient.new
      @logger = Logger.new($stdout)
    end
    
    def run
      logger.info("Running...")
      output_generator.generate(properties, FILENAME)
      logger.info("Finished successfully!")

    rescue FormatNotSupported => error
      logger.error("An error occurred: #{error.message}")
    end

    private

    attr_reader :client
    attr_reader :output_generator
    attr_reader :logger

    def properties
      result = client.fetch_properties
      properties = []
      result.find_each do |property|
        properties << property.title
      end
      properties
    end
  end
end
