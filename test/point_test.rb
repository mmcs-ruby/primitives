
require "test_helper"

class ElementaryTests < Minitest::Unit::TestCase
  include ::Primitives::Elementary

  def testing_initializer
    point = Point.new(1,2)
    assert_equal 1, point.x
    assert_equal  2, point.y
  end

  def testing_initializer_raising_exceptions
    assert_raises Point.new(1.2, "3")
  end


  def test_move
    point = Point.new(1,2)
    point2 = point.move(1, 3)
    assert_equal 2, point2.x
    assert_equal 5, point2.y
    assert_equal 1, point.x
    assert_equal  2, point.y
  end

  def test_move!
    point = Point.new(1,2)
    point.move!(1, 3)
    assert_equal 2, point.x
    assert_equal 5, point.y
  end

end
