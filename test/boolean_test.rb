require "test_helper"

class BooleanTest < Minitest::Test
  include Primitives
  include Primitives::Elementary
  include Primitives::Boolean

  def setup
    p1t1 = Point.new(1, 1)
    p2t1 = Point.new(4, 1)
    p3t1 = Point.new(3, 3)
    @triangle1 = Shape::Triangle.new(p1t1, p2t1, p3t1)

    p1t2 = Point.new(8, 2)
    p2t2 = Point.new(10, 2)
    p3t2 = Point.new(9, 4)
    @triangle2 = Shape::Triangle.new(p1t2, p2t2, p3t2)
  end

  def test_intersection_of_shapes_which_have_not_shared_sectors_returned_an_empty_polygon_set
    polygon_set = intersect_triangles(@triangle1, @triangle2)
    assert_equal 0, polygon_set.size
  end
end
