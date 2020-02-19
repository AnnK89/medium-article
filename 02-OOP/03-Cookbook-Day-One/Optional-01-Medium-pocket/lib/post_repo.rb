require_relative 'post'
require 'csv'
require 'pry-byebug'

class PostRepo
  def initialize(csv_file)
    @posts = []
    @csv = csv_file
    load_from_csv
  end

  def add(post)
    @posts << post
    save_to_csv
  end

  def all
    @posts
  end

  def find_post(index)
    @posts[index]
  end

  def mark_as_read(index)
    @posts[index].mark_as_read!
    save_to_csv
  end

  private

  def load_from_csv
    CSV.foreach(@csv) do |row|
      @posts << Post.new(
        path: row[0],
        name: row[1],
        content: row[2],
        author: row[3],
        read: row[4]
      )
    end
  end

  def save_to_csv
    CSV.open(@csv, 'wb') do |csv|
      @posts.each do |post|
        csv << [post.path, post.name, post.content, post.author, post.read?]
      end
    end
  end
end
