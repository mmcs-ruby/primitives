module Primitives
  module Elementary
    class Point
      attr_reader :x
      attr_reader :y

      def initialize(x, y)
        # Your code goes here...
      end

      def move(offset_x, offset_y)
        # Your code goes here...
      end

      def move!(offset_x, offset_y)
        # Your code goes here...
      end

      def mirror(straight_line)
        # Your code goes here...
      end

      def mirror!(straight_line)
        # Your code goes here...
      end

      def rotate(degrees, center)
        # Your code goes here...
      end

      def rotate!(degrees, center)
        # Your code goes here...
      end
    end
  end
end
