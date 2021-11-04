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

      def check_argument(arg)
        raise TypeError, "Invalid type of argument (Must be Numeric)" unless arg.is_a?(Numeric)
      end
    end
  end
end
