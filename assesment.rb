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
        negatives = values.select { |n| n.to_i < 0 }
        raise "negative values not allowed: #{negatives.join(", ")}" if negatives.any?
        values.sum(&:to_i)
    end
    
end
# 
puts StringCalculator.addition("") # => 0
puts StringCalculator.addition("2") # => 2
puts StringCalculator.addition("3,5") # => 8
puts StringCalculator.addition("6\n4,8") # => 18
puts StringCalculator.addition("5,6,7,8,9")# => 35
puts StringCalculator.addition("//;\n2;8") # => 10
# puts StringCalculator.addition("5,-7") # unlock the line to see error
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
    # Test for adding with new line
    
    def test_addition_with_new_lines_between_numbers
        assert_equal 14, StringCalculator.addition("2\n3,9")
    end
    # Test for adding with a multiple number
    def test_addition_with_multiple_numbers
        assert_equal 30, StringCalculator.addition("4,5,6,7,8")
    end
    # Test for adding with delimiter
    def test_addition_with_delimiters
        assert_equal 14, StringCalculator.addition("//;\n6;8")
    end
    # Test for adding with negetive numbers
    def test_addition_with_negative_number_raises_exception
        assert_raises(RuntimeError) { StringCalculator.addition("5,-9") }
    end
    # Test for adding with multiple negetive numbers
    def test_addition_with_multiple_negative_numbers_raises_exception_and_shows_message
        exception = assert_raises(RuntimeError) { StringCalculator.addition("5,-7,-8") }
        assert_match /negative values not allowed: -7, -8/, exception.message
      end
end