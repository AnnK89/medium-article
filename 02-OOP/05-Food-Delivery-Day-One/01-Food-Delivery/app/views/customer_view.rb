class CustomerView
  def ask_for_input(message)
    puts message
    print "> "
    gets.chomp
  end

  def display(customers)
    customers.each { |customer| puts customer.name }
  end
end
