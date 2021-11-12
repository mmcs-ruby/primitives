require "./test/test_helper"

class ElementaryTest < Minitest::Test
  include Primitives
  include Primitives::Elementary
  @@delta = 1e-5

  def setup
    @point = Elementary::Point.new(2.3, 5.1)
    @point2 = Elementary::Point.new(3, 3)
    @s_line1 = Elementary::StraightLine.new(3, 2, 1)
    @s_line2 = Elementary::StraightLine.new(5, -6, -1)
	@s_line1_f = Elementary::StraightLine.new(3.0, 2.0, 1.0)
    @s_line2_f = Elementary::StraightLine.new(5.0, -6.0, -1.0)
  end

  def test_point_attributes_set_correctly_on_instance_create
    assert_in_delta 2.3, @point.x, @@delta
    assert_in_delta 5.1, @point.y, @@delta
  end

  def test_point_initializer_rises_type_error_if_arguments_dont_satisfy_the_requirement_type
    assert_raises TypeError do
      Elementary::Point.new(1.2, "3")
    end
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

  def test_move_method_doesnt_affect_point_instance_on_which_it_was_applied
    original = @point
    _ = original.move 777, 777

    assert_in_delta 2.3, original.x, @@delta
    assert_in_delta 5.1, original.y, @@delta
  end

  def test_distance_between_point_and_straightline
    distance1 = @s_line1.shortest_distance_point @point
    distance2 = @s_line1.shortest_distance_point @point2
    assert_in_delta 5.020036, distance1, @@delta
    assert_in_delta 4.437601, distance2, @@delta
  end

  def test_check_line_intersection
    assert @s_line1.check_line_intersection @s_line2

    @s_line_float1 = Elementary::StraightLine.new(1.1, 2.2, 3.3)
    @s_line_float2 = Elementary::StraightLine.new(1.1, 2.2, 3.4)
    assert @s_line_float1.check_line_intersection @s_line_float2

    parallel_to_s_line1 = Elementary::StraightLine.new(3, 2, -5)
    assert @s_line1.check_line_intersection parallel_to_s_line1
  end

  def test_line_intersect
    point = @s_line1.line_intersection @s_line2
    assert_in_delta point.x, -0.14285, @@delta
    assert_in_delta point.y, -0.28571, @@delta

    parallel_to_s_line1 = Elementary::StraightLine.new(3, 2, -5)
    point1 = @s_line1.line_intersection parallel_to_s_line1
    assert_nil nil, point1
  end
  def test_distance_points
	p1 = Point.new(5.0, 6.0)
	p2 = Point.new(1.0, 3.0)
	assert_in_delta 5.0, distance_points(p1,p2), @@delta
  end
  def test_rectangle_area_1
	p1 = Point.new(5.0, 6.0)
	p2 = Point.new(1.0, 3.0)
	assert_in_delta 12.0, rectangle_area(p1,p2), @@delta
  end
  def test_rectangle_area_2
	p1 = Point.new(1.0, -6.0)
	p2 = Point.new(0.0, 3.0)
	assert_in_delta 9.0, rectangle_area(p1,p2), @@delta
  end
  def test_one_line_1
	p1 = Point.new(1.0, 1.0)
	p2 = Point.new(2.0, 2.0)
	p3 = Point.new(3.0, 3.0)
	assert one_line?(p1,p2,p3)
  end
  def test_one_line_2
	p1 = Point.new(1.0, 0.0)
	p2 = Point.new(7.0, 2.0)
	p3 = Point.new(1.0, 3.0)
	assert !one_line?(p1,p2,p3)
  end
  def test_rectangle_triangle_1
	p1 = Point.new(0.0, 0.0)
	p2 = Point.new(2.0, 0.0)
	p3 = Point.new(0.0, 7.0)
	assert_in_delta 7.0, rectangle_triangle(p1,p2,p3), @@delta
  end
  def test_rectangle_triangle_2
	p1 = Point.new(-3.0, 1.0)
	p2 = Point.new(-2.0, -2.0)
	p3 = Point.new(7.0, 7.0)
	assert_in_delta 18.0, rectangle_triangle(p1,p2,p3), @@delta
  end
  def test_intersect_straight_lines_by_points_1
	p1 = Point.new(-777.0, 2.0)
	p2 = Point.new(777.0, 2.0)
	p3 = Point.new(-7.0, -7.0)
	p4 = Point.new(7.0, 7.0)
	p5 = Point.new(2.0, 2.0)
	p6 = intersect_straight_lines_by_points(p1,p2,p3,p4)
	assert_in_delta p5.x,p6.x, @@delta
	assert_in_delta p5.y,p6.y, @@delta
  end
  def test_lines_are_parallel_by_points_1
	p1 = Point.new(-777.0, 2.0)
	p2 = Point.new(777.0, 2.0)
	p3 = Point.new(-777.0, 5.0)
	p4 = Point.new(777.0, 5.0)
	assert lines_are_parallel_by_points?(p1,p2,p3,p4)
  end
  def test_lines_are_parallel_by_points_2
	p1 = Point.new(-777.0, 2.0)
	p2 = Point.new(777.0, 7.0)
	p3 = Point.new(-777.0, 5.0)
	p4 = Point.new(777.0, 5.0)
	assert !lines_are_parallel_by_points?(p1,p2,p3,p4)
  end
  def test_angle_straight_lines_by_points_1
	p1 = Point.new(-7.0, 7.0)
	p2 = Point.new(7.0, -7.0)
	p3 = Point.new(-7.0, -7.0)
	p4 = Point.new(7.0, 7.0)
	a = angle_straight_lines_by_points(p1,p2,p3,p4)
	assert_in_delta 90,a, @@delta
  end
  def test_lines_are_perpendicular_by_points_1
	p1 = Point.new(-7.0, 7.0)
	p2 = Point.new(7.0, -7.0)
	p3 = Point.new(-7.0, -7.0)
	p4 = Point.new(7.0, 7.0)
	assert lines_are_perpendicular_by_points?(p1,p2,p3,p4)
  end
  def test_lines_are_perpendicular_by_points_2
	p1 = Point.new(-7.0, 777.0)
	p2 = Point.new(7.0, -7.0)
	p3 = Point.new(-7.0, -7.0)
	p4 = Point.new(7.0, 7.0)
	assert !lines_are_perpendicular_by_points?(p1,p2,p3,p4)
  end
  def test_intersect_straight_lines
	x = -1.0/7
	y=-2.0/7
	p1 = Point.new(x, y)
	p2 = intersect_straight_lines(@s_line1_f,@s_line2_f)
	assert_in_delta p1.x,p2.x, @@delta
	assert_in_delta p1.y,p2.y, @@delta
  end
  def test_lines_are_perpendicular_1
	assert !lines_are_perpendicular?(@s_line1_f,@s_line2_f)
  end
  def test_lines_are_perpendicular_2
	s_l1 = Elementary::StraightLine.new(1.0, 1.0, 0.0)
	s_l2 = Elementary::StraightLine.new(1.0, -1.0, 0.0)
	assert lines_are_perpendicular?(s_l1,s_l2)
  end
  def test_angle_straight_lines_1
	a = angle_straight_lines(@s_line1_f,@s_line2_f)
	assert_in_delta 83.8844964,a, @@delta
  end
  def test_angle_straight_lines_2
	s_l1 = Elementary::StraightLine.new(1.0, 1.0, 0.0)
	s_l2 = Elementary::StraightLine.new(1.0, -1.0, 0.0)
	a = angle_straight_lines(s_l1,s_l2)
	assert_in_delta 90,a, @@delta
  end
  def test_lines_are_parallel
	s_l1 = Elementary::StraightLine.new(1.0, 2.0, 0.0)
	s_l2 = Elementary::StraightLine.new(3.0, 6.0, 777.0)
	assert lines_are_parallel?(s_l1,s_l2)
  end
  def one_straightline
	s_l1 = Elementary::StraightLine.new(1.0, 2.0, 0.0)
	p1 = Point.new(-2.0, 1.0)
	assert one_straightline?(s_l1,p1)
  end
  def test_distances_between_parallel_lines
	s_l1 = Elementary::StraightLine.new(1.0, 2.0, 0.0)
	s_l2 = Elementary::StraightLine.new(3.0, 6.0, 777.0)
	a = distances_between_parallel_lines(s_l1,s_l2)
	assert_in_delta 115.828321,a, @@delta
  end
end