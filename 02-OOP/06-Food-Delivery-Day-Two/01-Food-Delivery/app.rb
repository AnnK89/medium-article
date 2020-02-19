# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative 'app/repositories/meal_repository.rb'
require_relative 'app/controllers/meals_controller.rb'

require_relative 'app/repositories/customer_repository.rb'
require_relative 'app/controllers/customers_controller.rb'

require_relative 'app/controllers/session_controller.rb'
require_relative 'app/repositories/employee_repository.rb'

require_relative 'app/repositories/order_repository.rb'
require_relative 'app/controllers/orders_controller.rb'

require_relative 'router'

meal_repository = MealRepository.new(File.join(__dir__, 'meals.csv'))
meals_controller = MealsController.new(meal_repository)

customer_repository = CustomerRepository.new(File.join(__dir__, 'customers.csv'))
customers_controller = CustomersController.new(customer_repository)

employee_repository = EmployeeRepository.new(File.join(__dir__, 'employees.csv'))
session_controller = SessionController.new(employee_repository)

order_repository = OrderRepository.new(File.join(__dir__, 'orders.csv'), meal_repository, employee_repository, customer_repository)
orders_controller = OrdersController.new(meal_repository, employee_repository, customer_repository, order_repository)

router = Router.new(meals_controller, customers_controller, orders_controller, session_controller)

router.run
