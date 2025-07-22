# test_triangle.rb

require 'test/unit'
require_relative 'triangle'

class TestTriangleArea < Test::Unit::TestCase
  def test_area
    assert_in_delta(triangle_area(10, 5), 25.0, 0.001)
    assert_in_delta(triangle_area(0, 5), 0.0, 0.001)
    assert_in_delta(triangle_area(3, 4), 6.0, 0.001)
    assert_in_delta(triangle_area(7.5, 2.0), 7.5, 0.001)
  end

  def test_negative_values
    assert_equal(-6.0, triangle_area(-3, 4))
    assert_equal(-6.0, triangle_area(3, -4))
    assert_equal(6.0, triangle_area(-3, -4))
  end

  def test_invalid_types
    assert_raise(TypeError) { triangle_area('3', 4) }
    assert_raise(TypeError) { triangle_area(3, '4') }
    assert_raise(TypeError) { triangle_area('3', '4') }
    assert_raise(TypeError) { triangle_area(true, 5) }
    assert_raise(TypeError) { triangle_area(5, false) }
    assert_raise(TypeError) { triangle_area(true, false) }
  end
end
