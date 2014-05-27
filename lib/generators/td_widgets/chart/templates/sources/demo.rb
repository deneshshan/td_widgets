module Sources 
  module Chart
    class Demo < Sources::Chart::Base
      def available?
        true
      end

      def get(options = {})
        { :value => rand(2) == 1 }
      end
    end
  end
end

