class PostsView
  # TODO: implement some methods here when controller needs to `puts` or `gets`
  def display(posts)
    posts.each { |post| puts "ID: #{post.id}, Title: #{post.title}, URL: #{post.url}, votes: #{post.votes}" }
  end

  def ask_for_id
    puts "Please enter the post id"
    gets.chomp
  end

  def ask_for_input(message)
    puts message
    gets.chomp
  end
end
