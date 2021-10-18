# frozen_string_literal: true

require_relative "primitives/version"

module Primitives
  class Error < StandardError; end

  require_relative 'primitives/elementary/affine'
  require_relative 'primitives/elementary/line_segment'
  require_relative 'primitives/elementary/metric'
  require_relative 'primitives/elementary/point'
  require_relative 'primitives/elementary/straight_line'

  require_relative 'primitives/shape/circle'
  require_relative 'primitives/shape/polygon'
  require_relative 'primitives/shape/rectangle'
  require_relative 'primitives/shape/trianlge'

  require_relative 'primitives/boolean'
  require_relative 'primitives/layout'
  require_relative 'primitives/plotter'
end
