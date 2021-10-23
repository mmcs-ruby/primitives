module Primitives
  module Layout
    class PolygonSet
      attr_reader :polygons

      def initialize(polygons)
        # Your code goes here...
      end

      # Moves every polygon inside the polygon set
      def move(offset_x, offset_y)
        # Your code goes here...
      end

      # Moves every polygon inside the polygon set
      def move!(offset_x, offset_y)
        # Your code goes here...
      end

      # Mirrors every polygon inside the polygon set
      def mirror(straight_line)
        # Your code goes here...
      end

      # Mirrors every polygon inside the polygon set
      def mirror!(straight_line)
        # Your code goes here...
      end

      # Rotates every polygon inside the polygon set
      def rotate(degrees, center)
        # Your code goes here...
      end

      # Rotates every polygon inside the polygon set
      def rotate!(degrees, center)
        # Your code goes here...
      end
    end
  end
end
