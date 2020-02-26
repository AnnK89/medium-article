# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    puts "Hello there"
    while @running
      show_login_page
      print_menu
      action = gets.chomp.to_i
      print `clear`
      route(action)
    end
    puts "Bye"
  end

  private

  def show_login_menu
    puts "> username?"
    name = gets.chomp
    puts "> password?"
    password = gets.chomp
    # if password = name.password
    # puts "Welcome #{name}"
    # else
    # puts "Wrong credentials... Try again!"
  end

  def print_menu
    puts "Please select an action"
    puts "1. List meals"
    puts "2. Add new meal"
    puts "3. List customers"
    puts "4. Add a new customer"
    puts "5. List undelivered orders"
    puts "6. Add a new order"
    puts "7. Exit"
    print "> "
  end

  def route(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @running = false
    else
      puts "Please select an index"
    end
  end
end
