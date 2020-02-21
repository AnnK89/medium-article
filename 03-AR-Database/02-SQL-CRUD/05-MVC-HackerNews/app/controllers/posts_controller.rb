require_relative '../models/post'
require_relative '../views/posts_view'

class PostsController
  def initialize
    @view = PostsView.new
  end

  def index
    # TODO: implement listing all posts
    posts = Post.all
    @view.display(posts)
  end

  def create
    # TODO: implement creating a new post
    url = @view.ask_for("URL?")
    title = @view.ask_for("Title?")
    post = Post.new(url: url, title: title)
    post.save
  end

  def update
    # TODO: implement updating an existing post
    id = @view.ask_for("ID?")
    post = Post.find(id)
    if post.nil?
      @view.display_error
    else
      post.title = @view.ask_for("Title?")
      post.url = @view.ask_for("URL?")
      post.save
    end
  end

  def destroy
    # TODO: implement destroying a post
    id = @view.ask_for("ID?")
    post = Post.find(id)
    post.destroy
  end

  def upvote
    # TODO: implement upvoting a post
    id = @view.ask_for("ID?")
    post = Post.find(id)
    post.votes += 1
    post.save
  end
end
