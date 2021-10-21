# frozen_string_literal: true

require_relative "primitives/version"
require_relative "primitives/elementary/affine"
require_relative "primitives/elementary/line_segment"
require_relative "primitives/elementary/metric"
require_relative "primitives/elementary/point"
require_relative "primitives/elementary/straight_line"

require_relative "primitives/shape/circle"
require_relative "primitives/shape/polygon"
require_relative "primitives/shape/rectangle"
require_relative "primitives/shape/triangle"

require_relative "primitives/boolean"
require_relative "primitives/layout"
require_relative "primitives/plotter"

module Primitives
  class Error < StandardError; end
end
