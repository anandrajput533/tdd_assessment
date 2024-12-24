require 'minitest/autorun'

class StringCalculator
  def self.addition(values)
    return 0 if values.empty?
    if values.start_with?("//")
        delimiter, values = values[2..].split("\n", 2)
        values = values.split(/#{Regexp.escape(delimiter)}|\n/)
      else
        values = values.split(/,|\n/)
      end
      values.map(&:to_i).sum      
  end
end
# 
puts StringCalculator.addition("") # => 0
puts StringCalculator.addition("2") # => 2
puts StringCalculator.addition("3,5") # => 8
puts StringCalculator.addition("6\n4,8") # => 18
puts StringCalculator.addition("5,6,7,8,9")# => 35
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
    assert_equal 15, StringCalculator.addition("6,9")
  end

  def test_addition_with_new_lines_between_numbers
    assert_equal 14, StringCalculator.addition("2\n3,9")
  end
  def test_addition_with_multiple_numbers
    assert_equal 30, StringCalculator.addition("4,5,6,7,8")
  end
end