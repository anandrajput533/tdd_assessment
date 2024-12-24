require 'minitest/autorun'

class StringCalculator
  def self.addition(values)
    return 0 if values.empty?
  end
end
# 
puts StringCalculator.addition("") # => 0

class StringCalculatorTest < Minitest::Test
  # Test for adding with an empty string.
  def test_addition_with_empty_string
    assert_equal 0, StringCalculator.addition("")
  end
end