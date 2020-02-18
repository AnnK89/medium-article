class OrderView
  def ask_for_id(message)
    puts message
    print "> "
    gets.chomp.to_i
  end

  def display(orders)
    orders.each do |order|
      puts "Customer: #{order.customer.name}, Meal: #{order.meal.name}, Employee: #{order.employee.id}"
    end
  end
end
