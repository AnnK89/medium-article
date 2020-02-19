require_relative 'post_repo'
require_relative 'post_controller'
require_relative 'router'

csv_file = File.join(__dir__, 'posts.csv')
repository = PostRepo.new(csv_file)
controller = PostController.new(repository)

router = Router.new(controller)

router.run
