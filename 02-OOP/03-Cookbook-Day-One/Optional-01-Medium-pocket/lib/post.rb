require 'pry-byebug'

class Post
  attr_accessor :id, :author
  attr_reader :path, :name, :content

  def initialize(attributes = {})
    @id = attributes[:id]
    @path = attributes[:path]
    @name = attributes[:name]
    @content = attributes[:content]
    @author = attributes[:author] # author instances
    @read = attributes[:read] == "true"
  end

  def read?
    @read
  end

  def to_s
    "#{name} (#{author})\n\n#{content}"
  end

  def mark_as_read!
    @read = true
  end
end
