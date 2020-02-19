class PostView
  def display(posts)
    posts.each_with_index do |post, index|
      read = post.read? ? "[X]" : "[ ]"
      puts "#{index + 1}. #{read} - #{post.name} (#{post.author})"
    end
  end

  def ask_user_for_input(message)
    puts message
    print "> "
    gets.chomp
  end

  def display_content(post)
    puts post
  end
end
