require "test_helper"

class ElementaryTests < Minitest::Test
  include ::Primitives::Elementary

  @@delta = 1e-5

  def setup
    @point = Point.new(2.3, 5.1)
  end

  def test_move_method_correctly_moved_the_point
    p = @point.move 5, 5

    assert_in_delta p.x, 7.3, @@delta
    assert_in_delta p.y, 10.1, @@delta
  end

  def test_dangerous_move_method_correctly_moved_the_point
    p = @point.dup
    p.move! 5, 5

    assert_in_delta p.x, 7.3, @@delta
    assert_in_delta p.y, 10.1, @@delta
  end
end
