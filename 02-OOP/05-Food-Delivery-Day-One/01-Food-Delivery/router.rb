# TODO: implement the router of your app.
class Router
  def initialize(meal_controller, customer_controller)
    @meal_controller = meal_controller
    @customer_controller = customer_controller
    @running = true
  end

  def run
    puts "Hello there"
    while @running
      print_menu
      action = gets.chomp.to_i
      print `clear`
      route(action)
    end
    puts "Bye"
  end

  private

  def print_menu
    puts "Please select an action"
    puts "1. List meals"
    puts "2. Add new meal"
    puts "3. List customers"
    puts "4. Add a new customer"
    puts "5. Exit"
    print "> "
  end

  def route(action)
    case action
    when 1 then @meal_controller.list
    when 2 then @meal_controller.add
    when 3 then @customer_controller.list
    when 4 then @customer_controller.add
    when 5 then @running = false
    else
      puts "Please select an index"
    end
  end
end
