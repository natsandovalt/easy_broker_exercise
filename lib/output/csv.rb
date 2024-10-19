require_relative 'base'
require 'csv'

module Output
  class Csv < Base
    def generate(data, filename)
      CSV.open("#{filename}.csv", 'w') do |csv|
        data.each { |row| csv << [row] }
      end
    end
  end
end