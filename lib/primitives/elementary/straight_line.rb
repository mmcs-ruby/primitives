# frozen_string_literal: true

module Primitives
  module Elementary
    # Ax + By + C = 0
    class StraightLine
      attr_reader :a, :b, :c

      def initialize(a, b, c)
        check_argument(a)
        check_argument(b)
        check_argument(c)
        @a = a
        @b = b
        @c = c
      end

      # @return distance between this line and point
      def shortest_distance_point(point)
        raise TypeError, "Invalid type of argument (Must be Point)" unless point.is_a? Point

        ((a * point.x + b * point.y + c).abs / Math.sqrt((a**2) + (b**2)))
      end

      # @return true if straight_lines intersect, otherwise false
      def check_line_intersection(straight_line)
        raise TypeError, "Invalid type of argument (Must be Point)" unless straight_line.is_a? StraightLine

        delta = 1e-6
        (@a * straight_line.b - straight_line.a * @b) < delta
      end

      # @return point if straight_lines intersect, otherwise nil
      def line_intersection(straight_line)
        raise TypeError, "Invalid type of argument (Must be Point)" unless straight_line.is_a? StraightLine

        delta = 1e-6
        if (@a * straight_line.b - straight_line.a * @b) < delta
          x = (@b * straight_line.c - straight_line.b * @c).to_f / (@a * straight_line.b - straight_line.a * @b)
          y = (straight_line.a * @c - @a * straight_line.c).to_f / (@a * straight_line.b - straight_line.a * @b)
          Point.new(x, y)
        end
      end

      private

      def check_argument(arg)
        raise TypeError, "Invalid type of argument (Must be Numeric)" unless arg.is_a?(Numeric)
      end
    end
  end
end
