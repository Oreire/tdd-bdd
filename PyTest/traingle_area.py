def triangle_area(base, height):
    if isinstance(base, bool) or isinstance(height, bool):
        raise TypeError("Booleans are not valid inputs")

    if not isinstance(base, (int, float)) or not isinstance(height, (int, float)):
        raise TypeError("Base and height must be int or float")

    if base < 0 or height < 0:
        raise ValueError("Base and height must be non-negative numbers")

    return 0.5 * base * height
