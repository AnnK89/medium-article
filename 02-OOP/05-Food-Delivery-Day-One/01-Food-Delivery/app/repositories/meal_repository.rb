require_relative '../models/meal.rb'
require 'csv'

class MealRepository
  def initialize(csv)
    @csv = csv
    @next_id = 1
    @meals = []
    load_csv
  end

  def all
    @meals
  end

  def add(meal)
    meal.id = @next_id
    @meals << meal
    @next_id += 1
    save_csv
  end

  def find(id)
    @meals.find { |meal| meal.id == id }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    if File.exist?(@csv)
      CSV.foreach(@csv, csv_options) do |row|
        row[:id] = row[:id].to_i
        row[:name] = row[:name]
        row[:price] = row[:price].to_i
        @meals << Meal.new(row)
        @next_id = row[:id] + 1
      end
    end
  end

  def save_csv
    csv_options = { write_headers: true, headers: ["id", "name", "price"] }
    CSV.open(@csv, 'wb', csv_options) do |csv|
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end
