require 'csv'
require_relative '../models/employee.rb'

class EmployeeRepository
  def initialize(csv)
    @csv = csv
    @employees = []
    @next_id = 1
    load_csv
  end

  def all_delivery_guys
    @employees.select { |employee| employee.role == "delivery_guy" }
  end

  def find(id)
    @employees.find { |employee| employee.id == id }
  end

  def find_by_username(username)
    @employees.find { |employee| employee.username == username }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    if File.exist?(@csv)
      CSV.foreach(@csv, csv_options) do |row|
        row[:id] = row[:id].to_i
        row[:username] = row[:username]
        row[:password] = row[:password]
        row[:role] = row[:role]
        @employees << Employee.new(row)
        @next_id = row[:id] + 1
      end
    end
  end
end
