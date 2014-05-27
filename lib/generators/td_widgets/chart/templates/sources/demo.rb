module Sources 
  module Chart
    class Demo < Sources::Chart::Base
      def available?
        true
      end

      def get(options = {})
        { 
          :series => ["Sales", "Income", "Expense"],
          :data => [
            { 
              :x => "Computers",
              :y => [ 54, 0, 879 ]
            },
            {
              :x => "ajbfwekjfbeq",
              :y => [ 86, 12, 20 ]
          ],
          :tooltip => "This is a tooltip"
        }
      end
    end
  end
end

