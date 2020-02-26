class Post
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
    @title = attributes[:title]
  end

  def self.find(id)
    DB.results_as_hash = true
    post = DB.execute("SELECT * FROM posts WHERE id = ?", id)
    return nil if post.empty?

    Post.new(post[0].transform_keys(&:to_sym))
  end

  def self.all
    DB.results_as_hash = true
    results = DB.execute("SELECT * FROM posts")
    results.map do |result|
      Post.new(result.transform_keys(&:to_sym))
    end
  end

  def save
    if @id.nil?
      query = "INSERT INTO posts (url, votes, title) VALUES ('#{@url}', '#{@votes}', '#{@title}')"
      DB.execute(query)
      @id = DB.last_insert_row_id
    else
      query = "UPDATE posts SET url = '#{@url}', votes = '#{@votes}', title = '#{@title}' WHERE id = '#{@id}'"
      DB.execute(query)
    end
  end

  def destroy
    DB.execute("DELETE FROM posts WHERE id = #{@id}")
  end
end
