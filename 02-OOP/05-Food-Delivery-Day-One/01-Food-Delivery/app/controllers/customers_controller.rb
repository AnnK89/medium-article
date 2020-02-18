require_relative '../views/customer_view.rb'

class CustomersController
  def initialize(repository)
    @repository = repository
    @view = CustomerView.new
  end

  def list
    customers = @repository.all
    @view.display(customers)
  end

  def add
    name = @view.ask_for_input("Name of customer?")
    address = @view.ask_for_input("Address?")
    customer = Customer.new(name: name, address: address)
    @repository.add(customer)
  end
end
