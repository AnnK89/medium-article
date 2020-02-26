class AuthorView
  def display(authors)
    authors.each_with_index { |author, index| "#{index + 1}. #{author.name}" }
  end



end
