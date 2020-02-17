class Router
  def initialize(controller)
    @controller = controller
    @running    = true
  end

  def run
    puts "-- My CookBook --"
    puts "What do you want to do?"

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.create
    when 3 then @controller.destroy
    when 4 then @controller.search
    when 5 then @controller.mark
    when 6 then stop
    else
      puts "Please try again"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "1. List all recipes"
    puts "2. Add a recipe"
    puts "3. Delete a recipe"
    puts "4. Import recipes from the Internet"
    puts "5. Mark as done"
    puts "6. Exit"
  end
end
