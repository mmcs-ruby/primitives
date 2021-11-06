module Primitives
  module Elementary
    class LineSegment
      attr_reader :begins_at
      attr_reader :ends_at

      def initialize(begins_at, ends_at)
        check_is_a_point(begins_at)
        check_is_a_point(ends_at)
        @begins_at = begins_at
        @ends_at = ends_at
      end

      # Count a length of a line segment based on two points
      def length
        begins_at.distance ends_at
      end

      # Return straight line object based points coordinates
      def to_straight_line
        a = ends_at.y - begins_at.y
        b = begins_at.x - ends_at.x
        c = -begins_at.x * ends_at.y + begins_at.y * ends_at.x
        StraightLine.new(a, b, c)
      end

      def check_is_a_point(x)
        unless x.is_a? Point
          fail TypeError.new "Invalid type of argument"
        end
      end

    end
  end
end
