require 'csv'
require_relative '../models/customer.rb'

class CustomerRepository
  def initialize(csv)
    @csv = csv
    @next_id = 1
    @customers = []
    load_csv
  end

  def all
    @customers
  end

  def add(customer)
    customer.id = @next_id
    @customers << customer
    save_csv
    @next_id += 1
  end

  def find(id)
    @customers.find { |customer| customer.id == id }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    if File.exist?(@csv)
      CSV.foreach(@csv, csv_options) do |row|
        row[:id] = row[:id].to_i
        row[:name] = row[:name]
        row[:address] = row[:address]
        @customers << Customer.new(row)
        @next_id = row[:id] + 1
      end
    end
  end

  def save_csv
    csv_options = { write_headers: true, headers: ["id", "name", "address"] }
    CSV.open(@csv, 'wb', csv_options) do |csv|
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end
