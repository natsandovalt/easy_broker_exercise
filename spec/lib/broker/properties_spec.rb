require 'broker/properties'
require 'output_generator'

RSpec.describe Broker::Properties do
  let(:output_generator) { instance_double(OutputGenerator) }
  let(:api_client) { double }

  before do
    allow(OutputGenerator).to receive(:new).and_return(output_generator)
    allow(Broker::ApiClient).to receive(:new).and_return(api_client)
    allow(Logger).to receive(:new).and_return(NullLogger.new)
  end
  
  describe '#run' do
    let(:properties) { ['Property 1', 'Property 2', 'Property 3'] }
    
    before do
      allow_any_instance_of(described_class).to receive(:properties).and_return(properties)
    end
    
    it 'runs successfully' do
      expect_any_instance_of(described_class).to receive(:properties)
      expect(output_generator).to receive(:generate).with(properties, 'properties')
      described_class.run('txt')
    end
  end
end
