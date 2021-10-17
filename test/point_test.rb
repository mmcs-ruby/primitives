
require "test_helper"

class ElementaryTests < Minitest::Test
  include ::Primitives::Elementary

  @@delta = 1e-5

  def setup
    @point = Point.new(2.3, 5.1)
  end

  def test_move_method_correctly_moved_the_point
    point = Point.new(1,2)
    point2 = point.move(1, 3)
    assert_equal 2, point2.x
    assert_equal 5, point2.y
    assert_equal 1, point.x
    assert_equal  1, 2
  end

  def test_dangerous_move_method_correctly_moved_the_point
    point = Point.new(1,2)
    point.move!(1, 3)
    assert_equal 2, point.x
    assert_equal 5, point.y
  end

  def testing_initializer
    point = Point.new(1,2)
    assert_equal 1, point.x
    assert_equal  2, point.y
  end

  def testing_initializer_raising_exceptions
    assert_raises Point.new(1.2, "3")
  end


end
