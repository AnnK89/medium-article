def fizz_buzz(number)
  # TODO: return an array of integers, 'Fizz', 'Buzz' or 'FizzBuzz'
  raise ArgumentError, "Number should be greater than 1!" if number < 1

  (1..number).map do |int|
    if (int % 3).zero? && (int % 5).zero?
      'FizzBuzz'
    elsif (int % 3).zero?
      'Fizz'
    elsif (int % 5).zero?
      'Buzz'
    else
      int
    end
  end
end

# Write a method fizz_buzz which takes a number as an argument, and
# return an array of number elements from 1 to number, but replaces some
# of them according to these rules:

# If the number is divisible by 3, then replace it by 'Fizz'
# If the number is divisible by 5, then replace it by 'Buzz'
# If the number is divisible by both 3 and 5, then replace it by 'FizzBuzz'
