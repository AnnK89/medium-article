require_relative '../views/order_view.rb'


class OrdersController
  def initialize(meal_repository, employee_repository, customer_repository, order_repository)
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @order_repository = order_repository
    @view = OrderView.new
  end

  def list_undelivered_orders
    undelivered_orders = @order_repository.undelivered_orders
    @view.display(undelivered_orders)
  end

  def add
    meal = @meal_repository.find(@view.ask_for_id("Meal ID?"))
    customer = @customer_repository.find(@view.ask_for_id("Customer ID?"))
    employee = @employee_repository.find(@view.ask_for_id("Employee ID?"))

    new_order = Order.new(meal: meal, employee: employee, customer: customer)
    @order_repository.add(new_order)
    @order_repository.save_csv
  end

  def list_my_orders(employee)
    my_orders = @order_repository.undelivered_orders.select do |order|
      order.employee.id == employee.id
    end
    @view.display(my_orders)
  end

  def mark_as_delivered(employee)
    if employee.role == 'delivery_guy'
      order_id = @view.ask_for_id("Order ID?")
      @order_repository.undelivered_orders.each do |order|
        order.deliver! if order_id == order.id
        @order_repository.save_csv
      end
    end
  end
end
