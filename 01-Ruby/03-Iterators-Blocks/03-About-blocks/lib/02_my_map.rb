def my_map(array)
  # TODO: Re-implement the same behavior as `Enumerable#map` without using it! You can use `#each` though.
  new_array = []
  array.each do |element|
    new_array << yield(element)
  end
  return new_array
end


# beatles = ["john", "paul", "george", "ringo"]

# my_map(beatles) do |name|
#   name.upcase
# end
# #=> ["JOHN", "PAUL", "GEORGE", RINGO"]

# numbers = [2, 4, 6, 8]

# my_map(numbers) do |number|
#   number * number
# end
# #=> [4, 16, 36, 64]
