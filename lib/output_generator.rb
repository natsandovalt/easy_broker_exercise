require_relative 'output/base'
require_relative 'output/csv'
require_relative 'output/txt'
require_relative 'errors/format_not_supported'
require 'logger'

class OutputGenerator
  GENERATORS = {
    txt: Output::Txt,
    csv: Output::Csv,
  }.freeze

  attr_reader :format
  attr_reader :logger

  def initialize(format)
    @format = format
    @logger = Logger.new($stdout)
  end

  def generate(data, filename)
    raise FormatNotSupported, "#{format} is not supported!" unless GENERATORS.key?(format)

    logger.info("Generating #{format} file...")
    GENERATORS[format].generate(data, filename)
  end
end
