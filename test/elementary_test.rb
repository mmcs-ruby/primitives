require "./test/test_helper"

class ElementaryTest < Minitest::Test
  include Primitives

  @@delta = 1e-5

  def setup
    @point = Elementary::Point.new(2.3, 5.1)
    @line_segment = Elementary::LineSegment.new(Elementary::Point.new(2.2, 3.3),Elementary::Point.new(5.5, 6.6))
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

  def test_line_length
    length = @line_segment.length
    assert_in_delta 4.66690, length, @@delta
  end

  def test_to_straight_line
    # test will be added when straight line class is approved
  end

end
