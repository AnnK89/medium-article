require_relative 'post.rb'

class Author
  attr_accessor :id
  attr_reader :posts, :name, :info

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @posts = attributes[:posts] # post instances
    @info = attributes[:info]
  end

  def add_post(post)
    @posts << post
    post.author = self
  end
end
