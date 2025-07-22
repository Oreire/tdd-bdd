# triangle.rb

def triangle_area(base, height)
  unless base.is_a?(Numeric) && height.is_a?(Numeric)
    raise TypeError, 'Base and height must be numbers'
  end
  0.5 * base * height
end
