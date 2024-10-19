require 'output/txt'
require 'output/csv'
require 'errors/format_not_supported'
require 'output_generator'

RSpec.describe OutputGenerator do
  describe '#generate' do
    let(:data) { ['test', 'data'] }
    let(:filename) { 'test' }

    before do
      allow(Logger).to receive(:new).and_return(NullLogger.new)
    end
    
    context 'supported formats' do
      context 'txt' do
        let(:generator) { instance_double(Output::Txt) }

        before do
          allow(Output::Txt).to receive(:new).and_return(generator)
        end
        
        it 'calls the corresponding class' do
          expect(generator).to receive(:generate).with(data, filename)
          described_class.new(:txt).generate(data, filename)
        end
      end

      context 'csv' do
        let(:generator) { instance_double(Output::Csv) }

        before do
          allow(Output::Csv).to receive(:new).and_return(generator)
        end
        
        it 'calls the corresponding class' do
          expect(generator).to receive(:generate).with(data, filename)
          described_class.new(:csv).generate(data, filename)
        end
      end
    end

    context 'unsupported format' do
      it 'raises an exception' do
        expect do
          described_class.new(:xml).generate(data, filename)
        end.to raise_error(FormatNotSupported, "xml is not supported!")
      end
    end
  end
end
