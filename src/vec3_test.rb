# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'vec3'

# Unit tests for the Vec3 class
class Vec3Test < Minitest::Test
  def test_attr_reader
    vec = Vec3.new(1, 2, 3)
    assert_equal(vec.x, 1)
    assert_equal(vec.y, 2)
    assert_equal(vec.z, 3)
  end
end
