require_relative 'post_repo'
require_relative 'author_repo'
require_relative 'post_controller'
require_relative 'author_controller'
require_relative 'router'

post_csv = File.join(__dir__, 'posts.csv')
author_csv = File.join(__dir__, 'authors.csv')


author_repository = AuthorRepo.new(author_csv)
post_repository = PostRepo.new(post_csv, author_repository)

post_controller = PostController.new(post_repository, author_repository)
author_controller = AuthorController.new(author_repository)

router = Router.new(post_controller, author_controller)

router.run
