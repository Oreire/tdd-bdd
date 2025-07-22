import unittest

def triangle_area(base, height):
    """
    Calculates the area of a triangle.
    Validates that inputs are non-negative numbers.

    Args:
        base (int or float): The base of the triangle.
        height (int or float): The height of the triangle.

    Returns:
        float: Area of the triangle.

    Raises:
        TypeError: If inputs are not int or float.
        ValueError: If base or height are negative.
    """
    if not isinstance(base, (int, float)) or not isinstance(height, (int, float)):
        raise TypeError("Base and height must be int or float")
    if base < 0 or height < 0:
        raise ValueError("Base and height must be non-negative numbers")
    return 0.5 * base * height


class TestTriangleArea(unittest.TestCase):
    def test_valid_inputs(self):
        self.assertAlmostEqual(triangle_area(10, 5), 25.0)
        self.assertAlmostEqual(triangle_area(3, 4), 6.0)
        self.assertAlmostEqual(triangle_area(7.5, 2.0), 7.5)
        self.assertAlmostEqual(triangle_area(0, 5), 0.0)
        self.assertAlmostEqual(triangle_area(5, 0), 0.0)

    def test_negative_inputs(self):
        with self.assertRaises(ValueError):
            triangle_area(-3, 4)
        with self.assertRaises(ValueError):
            triangle_area(3, -4)
        with self.assertRaises(ValueError):
            triangle_area(-3, -4)

    def test_invalid_types(self):
        invalid_cases = [
            # Strings
            ("3", 4), (3, "4"), ("3", "4"),
            ("", 5), (5, ""), ("", ""),
            
            # None
            (None, 5), (5, None), (None, None),

            # Booleans
            (True, 4), (4, False), (True, False),

            # Collections
            ([3], 4), (3, [4]), ([3], [4]),
            ({}, 2), (2, {}), ({"base": 3}, {"height": 4})
        ]

        for base, height in invalid_cases:
            with self.assertRaises(TypeError, msg=f"Failed for inputs: {base}, {height}"):
                triangle_area(base, height)


if __name__ == "__main__":
    unittest.main()
