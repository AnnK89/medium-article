require_relative 'post'
require_relative 'post_repo'
require_relative 'post_view'
require_relative 'scraper'
require 'pry-byebug'

class PostController
  def initialize(post_repository, author_repository)
    @post_repository = post_repository
    @author_repository = author_repository
    @view = PostView.new
  end

  def list
    posts = @post_repository.all

    @view.display(posts)
  end

  def create
    path = @view.ask_user_for_input("Path?")
    file = open("https://dev.to/#{path}").read
    doc = Nokogiri::HTML(file)
    title = doc.search("h1").first.text.strip
    paragraphs = doc.search("#article-body p")
    content = paragraphs.map(&:text).join("\n\n")
    author = doc.search(".author").first&.text.strip
    # path = @view.ask_user_for_input("Path?")
    # title = scraper(path, '.title .medium')
    # content = scraper_content(path, '#article-body p')
    # author = scraper(path, '.author')
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
