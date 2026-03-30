# frozen_string_literal: true

# For 3D vectors and points
class Vec3
  def initialize(x, y, z)
    @x = x
    @y = y
    @z = z
  end

  attr_reader :x, :y, :z

  def -@
    Vec3(-@x, -@y, -@z)
  end

  def +(other)
    raise TypeError, "Unsupported + operation between type Vec3 and type #{other.class}" unless other.class.is_a? Vec3

    Vec3(@x + other.x, @y + other.y, @z + other.z)
  end

  def *(other)
    Vec3(@x * other, @y * other, @z * other)
  end

  def /(other)
    self * 1 / other
  end

  def length_squared
    (@x * @x) + (@y * @y) + (@z * @z)
  end

  def length
    Math.sqrt length_squared
  end

  def to_s
    "#{@x} #{@y} #{@z}"
  end
end
