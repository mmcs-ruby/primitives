module Primitives
  module Elementary
    class Point

      def check_argument(arg)
        unless arg.is_a?(Integer)
          raise TypeError.new "Invalid type of argument (Must be Int)"
        end
      end

      def initialize(x, y)
        check_argument(x)
        check_argument(y)
        @x = x
        @y = y
      end

      # Changes point's position
      def move!(offset_x, offset_y)
        self = self.move(offset_x, offset_y)
      end

      # Changes point's position
      def move(offset_x, offset_y)
        check_argument(offset_x)
        check_argument(offset_y)
        return Point.new(@x + offset_x, @y + offset_y)
      end

      #Reflects a point by the line
      # line is an instance of class Line
      def mirror!(line)
        fail "Not implemented"
      end

      #Reflects a point by the line
      # line is an instance of class Line
      # http://www.mathhelpplanet.com/viewtopic.php?f=33&t=2303
      # TODO:
      def mirror(line)
        fail "Not implemented"
      end

      #@return distance between two points
      def distance(point)
        unless point.is_a? Point
          fail TypeError.new "Invalid type of argument"
        end
        return Math.sqrt((@x - point.x)**2 + (@y - point.y)**2)
      end
    end
  end
end
