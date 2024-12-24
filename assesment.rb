require 'minitest/autorun'

class StringCalculator
  def self.addition(values)
    return 0 if values.empty?
    values = values.split(/,|\n/)
    values.map(&:to_i).sum
  end
end
# 
puts StringCalculator.addition("") # => 0
puts StringCalculator.addition("2") # => 2
puts StringCalculator.addition("3,5") # => 8

#  test Cases
class StringCalculatorTest < Minitest::Test
  # Test for adding with an empty string.
  def test_addition_with_empty_string
    assert_equal 0, StringCalculator.addition("")
  end
  # Test for adding with a number
  def test_addition_with_one_number
    assert_equal 2, StringCalculator.addition("2")
  end
  # Test for adding with a Two number
  def test_addition_with_two_numbers
    assert_equal 8, StringCalculator.addition("3,5")
  end

end