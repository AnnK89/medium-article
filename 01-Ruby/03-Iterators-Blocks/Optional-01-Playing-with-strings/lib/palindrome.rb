def palindrome?(a_string)
  # TODO: check if a_string is a palindrome
  return false if a_string.empty?

  a_string = a_string.downcase.delete("- ,!'")
  a_string == a_string.reverse
end

# p palindrome?("wagon")
# p palindrome?("Laval")
# p palindrome?("Madam, I'm Adam!")
