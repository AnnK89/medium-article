ROMAN_INT =
  {
    I: 1,
    V: 5,
    X: 10,
    L: 50,
    C: 100,
    D: 500,
    M: 1000
  }

def roman_to_integer(roman_string)
  sum = 0
  int_num = roman_string.split("").map { |x| ROMAN_INT[x.to_sym] }
  # ["X", "I", "I"], get value by using key ROMAN_INT["X".to_sym], return an array of values
  int_num.each_with_index do |num, index| # iterate through [10, 1, 1]
    if index + 1 == int_num.size
      sum += num
    elsif int_num[index] >= int_num[index + 1]
      sum += num
    else
      sum -= num
    end
  end
  sum
end
