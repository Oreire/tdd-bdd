# spec/triangle_spec.rb

require_relative '../triangle'

RSpec.describe '#triangle_area' do
  context 'with valid inputs' do
    it 'calculates area correctly for positive integers and floats' do
      expect(triangle_area(10, 5)).to eq(25.0)
      expect(triangle_area(0, 5)).to eq(0.0)
      expect(triangle_area(3, 4)).to eq(6.0)
      expect(triangle_area(7.5, 2.0)).to eq(7.5)
    end
  end

  context 'with negative values' do
    it 'raises ArgumentError when base is negative' do
      expect { triangle_area(-3, 4) }.to raise_error(ArgumentError, 'Base must be a non-negative number')
    end

    it 'raises ArgumentError when height is negative' do
      expect { triangle_area(3, -4) }.to raise_error(ArgumentError, 'Height must be a non-negative number')
    end

    it 'raises ArgumentError when both are negative' do
      expect { triangle_area(-3, -4) }.to raise_error(ArgumentError, 'Base must be a non-negative number')
    end
  end

  context 'with invalid types' do
    it 'raises TypeError for strings, booleans, nil, arrays, hashes' do
      invalid_inputs = [
        ['3', 4], [3, '4'], ['3', '4'],
        [true, 5], [5, false], [true, false],
        [nil, 5], [5, nil], [[3], 4], [3, { height: 4 }]
      ]

      invalid_inputs.each do |base, height|
        expect { triangle_area(base, height) }.to raise_error(TypeError, 'Both base and height must be numbers (Integer or Float)')
      end
    end
  end
end
