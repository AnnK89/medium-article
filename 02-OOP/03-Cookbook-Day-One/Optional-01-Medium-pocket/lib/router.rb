class Router
  def initialize(post_controller, author_controller)
    @post_controller = post_controller
    @author_controller = author_controller
    @running = true
  end

  def run
    puts "---------------------------------"
    puts "Welcome to your DEV Pocket Reader"
    puts "---------------------------------"

    while @running
      print_menu
      action = gets.chomp.to_i
      puts ""
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @post_controller.list
    when 2 then @post_controller.create
    when 3 then @post_controller.display_content
    when 4 then @post_controller.mark_as_read
    when 5 then @author_controller.list
    when 6 then @author_controller.display_post
    when 7 then @author_controller.display_info
    when 8 then stop
    else
      puts "Please try again"
    end
  end

  def stop
    @running = false
  end

  def print_menu
    puts ""
    puts "----------------------------"
    puts "What do you want to do next?"
    puts "----------------------------"
    puts "1. List posts"
    puts "2. Save post for later"
    puts "3. Read post"
    puts "4. Mark post as read"
    puts "5. List authors"
    puts "6. List author's posts"
    puts "7. See author info"
    puts "8. Exit"
    print "> "
  end
end
