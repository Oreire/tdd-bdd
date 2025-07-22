# triangle.rb

def triangle_area(base, height)
  unless base.is_a?(Numeric) && height.is_a?(Numeric)
    raise TypeError, 'Both base and height must be numbers (Integer or Float)'
  end

  if base < 0
    raise ArgumentError, 'Base must be a non-negative number'
  end

  if height < 0
    raise ArgumentError, 'Height must be a non-negative number'
  end

  0.5 * base * height
end
