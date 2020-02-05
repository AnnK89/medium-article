def bugged_concatenate(array)
  concatenated_string = ""
  array.each do |element|
    element = element.to_s
    concatenated_string = concatenated_string + element
  end
  return concatenated_string.upcase
end

def build_1984_title
  bugged_concatenate([1, "9", 84, " ", "George Orwell"])
end

p build_1984_title
