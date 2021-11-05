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

        ((a * point.x + b * point.y + c).abs / Math.sqrt((a ** 2) + (b ** 2)))
      end

      def intersect_check(straigt_line)
        raise TypeError, "Invalid type of argument (Must be Point)" unless point.is_a? StraightLine
      end

      def check_argument(arg)
        raise TypeError, "Invalid type of argument (Must be Numeric)" unless arg.is_a?(Numeric)
      end
    end
  end
end
