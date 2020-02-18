# TODO: implement the router of your app.
class Router
  def initialize(controller)
    @controller = controller
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
    puts "3. Exit"
    print "> "
  end

  def route(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.add
    when 3 then @running = false
    else
      puts "Please select an index"
    end
  end
end
