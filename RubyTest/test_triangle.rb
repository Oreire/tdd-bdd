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
    assert_raise_with_message(ArgumentError, 'Base must be a non-negative number') { triangle_area(-3, 4) }
    assert_raise_with_message(ArgumentError, 'Height must be a non-negative number') { triangle_area(3, -4) }
    assert_raise_with_message(ArgumentError, 'Base must be a non-negative number') { triangle_area(-3, -4) }
  end

  def test_invalid_types
    # Strings
    assert_raise(TypeError) { triangle_area('3', 4) }
    assert_raise(TypeError) { triangle_area(3, '4') }
    assert_raise(TypeError) { triangle_area('3', '4') }

    # Booleans
    assert_raise(TypeError) { triangle_area(true, 5) }
    assert_raise(TypeError) { triangle_area(5, false) }

    # Nil
    assert_raise(TypeError) { triangle_area(nil, 5) }
    assert_raise(TypeError) { triangle_area(5, nil) }

    # Arrays and hashes
    assert_raise(TypeError) { triangle_area([3], 4) }
    assert_raise(TypeError) { triangle_area(3, {height: 4}) }
  end

  private

  # Custom helper for error message testing
  def assert_raise_with_message(exception, message)
    error = assert_raise(exception) { yield }
    assert_equal(message, error.message)
  end
end
