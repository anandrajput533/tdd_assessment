require 'minitest/autorun'

class StringCalculator
  def self.addition(values)
    return 0 if values.empty?
    return values.to_i if values.length == 1
  end
end
# 
puts StringCalculator.addition("") # => 0
puts StringCalculator.addition("2") # => 3
class StringCalculatorTest < Minitest::Test
  # Test for adding with an empty string.
  def test_addition_with_empty_string
    assert_equal 0, StringCalculator.addition("")
  end
  # Test for adding with a number
  def test_addition_with_one_number
    assert_equal 2, StringCalculator.addition("2")
  end
end