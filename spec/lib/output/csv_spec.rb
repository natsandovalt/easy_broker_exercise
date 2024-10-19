require 'output/base'
require 'output/csv'

RSpec.describe Output::Csv do
  let(:filename) { 'csv' }
  let(:path) { "#{filename}.csv" }
  let(:data) { ['Line 1', 'Line 2'] }

  after do
    File.delete(path) if File.exist?(path)
  end

  it 'generates a file with the correct data' do
    described_class.generate(data, filename)
    expect(File.exist?(path)).to be(true)
    content = File.read(path)
    expected_content = data.map { |line| "#{line}\n" }.join
    expect(content).to eq(expected_content)
  end
end
