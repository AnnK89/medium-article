require 'pry-byebug'

class Post
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
    @title = attributes[:title]
  end

  def save
    # result = DB.execute("SELECT * FROM posts WHERE id = '#{@id}'")
    if @id.nil?
      query = "INSERT INTO posts (url, votes, title) VALUES ('#{@url}', '#{@votes}', '#{@title}')"
      DB.execute(query)
      @id = DB.last_insert_row_id
    else
      query = "UPDATE posts SET url = '#{@url}', votes = '#{@votes}', title = '#{@title}' WHERE id = '#{@id}'"
      DB.execute(query)
    end
  end
end
