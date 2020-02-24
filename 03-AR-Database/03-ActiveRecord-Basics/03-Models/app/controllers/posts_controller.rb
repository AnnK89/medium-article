require_relative "../views/posts_view"

class PostsController
  def initialize
    @view = PostsView.new
  end

  def index
    posts = Post.all
    @view.display(posts)
  end

  def create
    title = @view.ask_for_input("Title?")
    url = @view.ask_for_input("URL?")
    post = Post.new(title: title, url: url)
    post.save
  end

  def update
    post = Post.find(@view.ask_for_id)
    change_field = @view.ask_for_input("What would you like to update?")
    symbolized = (change_field + "=").downcase.to_sym # :title=
    new_info = @view.ask_for_input("Please enter the new information")
    post.send(symbolized, new_info)

    post.save
  end

  def destroy
    id = @view.ask_for_id
    post = Post.find(id)
    post.destroy
  end

  def upvote
    id = @view.ask_for_id
    post = Post.find(id)
    post.votes += 1
    post.save
  end
end
