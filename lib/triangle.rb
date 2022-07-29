require 'pry'

class Triangle
  # write code here
  attr_accessor :a, :b, :c, :sides

  def initialize(a, b, c)
    @sides = a, b, c
    @a = a
    @b = b
    @c = c
  end

  def kind
    validate_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c 
      :isosceles
    else
      :scalene
    end
  end

  def sides_greater_than_zero?
    [a, b, c].all?(&:positive?)
  end
  
  def valid_triangle_inequality?
    a + b > c && a + c > b && b + c > a
  end

  def validate_triangle
    raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
  end


  class TriangleError < StandardError
    # triangle error code
  end
end
