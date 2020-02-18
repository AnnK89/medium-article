require 'csv'
require_relative '../models/order.rb'
require_relative '../repositories/meal_repository.rb'
require_relative '../repositories/employee_repository.rb'
require_relative '../repositories/customer_repository.rb'

class OrderRepository
  def initialize(csv, meal_repository, employee_repository, customer_repository)
    @csv = csv
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @orders = []
    @next_id = 1
    load_csv
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered? }
  end

  def add(order)
    order.id = @next_id
    @orders << order
    @next_id += 1
    save_csv
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }

    if File.exist?(@csv)
      CSV.foreach(@csv, csv_options) do |row|
        row[:id] = row[:id].to_i
        # row[:meal_id] = row[:meal_id].to_i
        # row[:employee_id] = row[:employee_id].to_i
        # row[:customer_id] = row[:customer_id].to_i
        row[:delivered] = row[:delivered] == "true"

        order = Order.new(row)
        order.meal = @meal_repository.find(row[:meal_id].to_i)
        order.employee = @employee_repository.find(row[:employee_id].to_i)
        order.customer = @customer_repository.find(row[:customer_id].to_i)
        @orders << order

        @next_id = row[:id] + 1
      end
    end
  end

  def save_csv
    csv_options = { write_headers: true, headers: ["id", "meal_id", "employee_id", "customer_id", "delivered?"] }

    CSV.open(@csv, 'wb', csv_options) do |csv|
      @orders.each do |order|
        csv << [order.id, order.meal.id, order.employee.id, order.customer.id, order.delivered?]
      end
    end
  end
end
