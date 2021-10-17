# frozen_string_literal: true

require_relative "primitives/version"

module Primitives
  class Error < StandardError; end

  require_relative 'primitives/elementary'
  require_relative 'primitives/shape'
  require_relative 'primitives/boolean'
  require_relative 'primitives/layout'
  require_relative 'primitives/plotter'
end
