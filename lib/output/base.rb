module Output
  class Base
    class << self
      def generate(*args)
        new.generate(*args)
      end
    end

    def generate
      raise NotImplementedError, "#{self.class} needs to implement generate method"
    end
  end
end
