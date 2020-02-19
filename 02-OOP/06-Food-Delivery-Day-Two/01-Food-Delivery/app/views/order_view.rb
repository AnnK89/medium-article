class OrderView
  def ask_for_id(message)
    puts message
    print "> "
    gets.chomp.to_i
  end

  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}. Customer name: #{order.customer.name}, Meal name: #{order.meal.name}, Employee id: #{order.employee.id} "
    end
  end
end
