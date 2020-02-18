# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative 'app/repositories/meal_repository.rb'
require_relative 'app/repositories/customer_repository.rb'
require_relative 'app/controllers/meals_controller.rb'
require_relative 'app/controllers/customers_controller.rb'
require_relative 'router'

meal_repo = MealRepository.new(File.join(__dir__, 'meals.csv'))
meal_controller = MealsController.new(meal_repo)

customer_repo = CustomerRepository.new(File.join(__dir__, 'customers.csv'))
customer_controller = CustomersController.new(customer_repo)

router = Router.new(meal_controller, customer_controller)

router.run
