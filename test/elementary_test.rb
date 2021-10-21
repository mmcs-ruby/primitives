require "test_helper"

class ElementaryTest < Minitest::Test
  include Primitives

  @@delta = 1e-5

  def setup
    @point = Elementary::Point.new(2.3, 5.1)
  end

  def test_move_method_correctly_moved_the_point
    p = @point.move 5, 5

    assert_in_delta 7.3, p.x, @@delta
    assert_in_delta 10.1, p.y, @@delta
  end

  def test_dangerous_move_method_correctly_moved_the_point
    p = @point.dup
    p.move! 5, 5

    assert_in_delta 7.3, p.x, @@delta
    assert_in_delta 10.1, p.y, @@delta
  end
end
