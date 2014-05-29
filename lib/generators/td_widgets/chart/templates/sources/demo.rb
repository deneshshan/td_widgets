module Sources 
  module Chart
    class Demo < Sources::Chart::Base

      def get(options = {})
        { 
          :series => ["Issues"],
          :data => [
            { 
              :x => "New",
              :y => [ random, random, random ]
            },
            {
              :x => "Open",
              :y => [ random, random, random ]
            },
            {
              :x => "Closed",
              :y => [ random, random, random ]
            }
          ]
        }
      end

      private

      def random
        rand(0..1000)
      end

    end
  end
end

