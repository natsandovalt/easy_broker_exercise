require 'broker/api_client'

RSpec.describe Broker::ApiClient do
  let(:api_client) { described_class.new }

  before do
    allow(Logger).to receive(:new).and_return(NullLogger.new)
  end
  
  describe '#fetch_properties' do
    it 'retrieves properties from the API' do
      result = api_client.fetch_properties
      expect(result).to respond_to(:find_each)
    end
  end
end
