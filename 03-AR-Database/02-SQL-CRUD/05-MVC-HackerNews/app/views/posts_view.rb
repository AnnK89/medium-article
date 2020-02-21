require_relative '../models/post'

class PostsView
  # TODO: implement methods called by the PostsController
  def display(posts)
    posts.each { |post| puts "ID: #{post.id}, URL: #{post.url}, votes: #{post.votes}, title: #{post.title}" }
  end

  def ask_for(message)
    puts message
    gets.chomp
  end

  def display_error
    puts "Please try again"
    return
  end
end
