require_relative 'post'
require 'csv'
require 'pry-byebug'

class PostRepo
  def initialize(csv_file, author_repository)
    @author_repository = author_repository
    @posts = []
    @csv = csv_file
    @next_id = 1

    load_from_csv
  end

  def add(post)
    @posts << post
    post.id = @next_id
    @next_id += 1
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

    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv, csv_options) do |row|

      row[:id] = row[:id].to_i
      row[:path] = row[:path],
      row[:name] = row[:name],
      row[:content] = row[:content],
      row[:author] = row[:author]
      row[:read?] = row[:read] == "true"
      new_post = Post.new(row)

      new_post.author = @author_repo.find(row[:author])

      @posts << new_post
      @next_id = row[:id] + 1
    end
  end

  def save_to_csv
    CSV.open(@csv, 'wb') do |csv|
      @posts.each do |post|
        csv << [post.path, post.name, post.content, post.author.id, post.read?]
      end
    end
  end
end
