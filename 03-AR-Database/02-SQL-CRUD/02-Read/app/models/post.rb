require 'pry-byebug'

# You can use a global variable, DB, which
# is an instance of SQLite3::Database
# NO NEED TO CREATE IT, JUST USE IT.

class Post
  attr_reader :id, :votes
  attr_accessor :title, :url

  def initialize(attributes = {})
    @title = attributes[:title]
    @url = attributes[:url]
    @votes = attributes[:votes]
    @id = attributes[:id]
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
end
