require_relative '../views/session_view.rb'
require_relative '../models/employee.rb'

class SessionController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionView.new
  end

  def login
    employee = validate_username
    validate_password(employee)
    employee
  end

  def validate_username
    name = @view.ask_for("Username?").downcase
    if @employee_repository.find_by_username(name)
      @employee_repository.find_by_username(name)
    else
      puts "Invalid username. Please try again"
      validate_username
    end
  end

  def validate_password(employee)
    password = @view.ask_for("Password?")
    puts ""
    if employee.password == password
      puts "Welcome #{employee.username.capitalize}"
    else
      puts "Wrong password... Try again!"
      login
    end
  end
end
