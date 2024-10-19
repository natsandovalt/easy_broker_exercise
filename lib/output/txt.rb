require_relative 'base'

module Output
  class Txt < Base
    def generate(data, filename)
      File.open("#{filename}.txt", 'w') do |file|
        data.each { |line| file.puts line }
      end
    end
  end
end
