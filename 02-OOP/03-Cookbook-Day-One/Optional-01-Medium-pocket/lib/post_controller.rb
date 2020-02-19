require_relative 'post'
require_relative 'post_repo'
require_relative 'post_view'
require_relative 'scraper'
require 'pry-byebug'

class PostController
  def initialize(repository)
    @repository = repository
    @view = PostView.new
  end

  def list
    posts = @repository.all
    @view.display(posts)
  end

  def create
    path = @view.ask_user_for_input("Path?")
    title = scraper(path, '.title .medium')
    content = scraper(path, '#article-body p')
    author = scraper(path, '.author')
    new_post = Post.new(path: path, name: title, content: content, author: author)
    @repository.add(new_post)
    list
  end

  def display_content
    list
    post_index = @view.ask_user_for_input("Please select the index")
    post = @repository.find_post(post_index.to_i - 1)
    @view.display_content(post)
  end

  def mark_as_read
    list
    index = @view.ask_user_for_input("Please select the index")
    @repository.mark_as_read(index.to_i - 1)
  end
end
