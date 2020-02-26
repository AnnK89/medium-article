class AuthorController
  def initialize(repository)
    @repository = repository
  end

  def list
    authors = @repository.all
    @view.display(authors)
  end

  def display_post
    author = @repository.find(id)
    author.posts.each_with_index do |post, index|
      puts "#{index + 1}. #{post.name}"
    end
  end

  def display_info
    author = @repository.find(id)
    author.info
  end
end
