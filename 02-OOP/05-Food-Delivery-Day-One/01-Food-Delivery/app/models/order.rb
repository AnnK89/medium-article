require_relative '../models/employee.rb'
require_relative '../models/meal.rb'
require_relative '../models/customer.rb'

class Order
  attr_accessor :id, :meal, :employee, :customer

  def initialize(attributes = {})
    @id = attributes[:id]
    @meal = attributes[:meal]
    @employee = attributes[:employee]
    @customer = attributes[:customer]
    @delivered = attributes[:delivered] || false
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end
