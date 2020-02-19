# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller, orders_controller, session_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @orders_controller = orders_controller
    @session_controller = session_controller
    @running = true
  end

  def run
    puts "Hello there"
    employee = show_login_page
    while @running
      if employee.manager?
        print(manager_menu)
        index = gets.chomp.to_i
        print `clear`
        manager_action_route(index)
      else
        print(delivery_guy_menu)
        index = gets.chomp.to_i
        print `clear`
        delivery_guy_action_route(index, employee)
      end
    end
    puts "Bye"
  end

  private

  def show_login_page
    @session_controller.login
  end

  def print(menu)
    menu
  end

  def manager_menu
    puts "Please select an action"
    puts ""
    puts "1. List all meals"
    puts "2. Add a new meal"
    puts "3. List all customers"
    puts "4. Add a new customer"
    puts "5. List all undelivered orders"
    puts "6. Add a new order"
    puts "7. Exit"
    print "> "
  end

  def delivery_guy_menu
    puts "Please select an action"
    puts ""
    puts "1. List my undelivered orders"
    puts "2. Mark order as delivered"
    puts "3. Exit"
    print "> "
  end

  def manager_action_route(index)
    case index
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @orders_controller.list_undelivered_orders
    when 6 then @orders_controller.add
    when 7 then @running = false
    else
      puts "Please select an index"
    end
  end

  def delivery_guy_action_route(index, employee)
    case index
    when 1 then @orders_controller.list_my_orders(employee)
    when 2 then @orders_controller.mark_as_delivered(employee)
    when 3 then @running = false
    else
      puts "Please select an index"
    end
  end
end
