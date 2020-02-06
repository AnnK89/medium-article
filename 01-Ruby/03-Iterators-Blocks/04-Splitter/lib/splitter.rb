def size_splitter(array, size)
  # TODO: Return an array of two arrays, the first containing
  #       words of length `size`, the second containing all the other words
  #       In addition to this split, each array should be *sorted*.
  new_array = []
  new_array << array.select { |word| word.size == size }.sort
  new_array << array.reject { |word| word.size == size }.sort
  return new_array
end

def block_splitter(array)
  # TODO: Return an array of two arrays, the first containing
  #       elements for which the given block yields true,
  #       the second containing all the other elements.
  #       No sort needed this time.
  new_array = []
  new_array << array.select { |name| yield(name) }
  new_array << array.reject { |name| yield(name) }
  return new_array
end


# words = %w(dog data ask my win two beer as)
# p result = size_splitter(words, 3)

# result => [["ask", "dog", "two", "win"], ["as", "beer", "data", "my"]]

# beatles = [ "John", "Paul", "Ringo", "George" ]

# result = block_splitter(beatles) { |beatle| beatle.start_with?("P") }

# # result => [ [ "Paul" ], [ "John", "Ringo", "George" ] ]
