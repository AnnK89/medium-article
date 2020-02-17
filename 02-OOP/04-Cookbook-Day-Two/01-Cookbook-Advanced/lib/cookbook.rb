require 'csv'
require 'pry-byebug'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)
    @recipes = [] # <--- Recipe instances
    @filepath = csv_file_path
    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    store_to_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    store_to_csv
  end

  def mark_as_done(index)
    @recipes[index].mark_as_done!
    store_to_csv
  end

  private

  def load_csv
    CSV.foreach(@filepath, headers: :first_row, header_converters: :symbol) do |row|
      prep_time = (row[2].nil? ? "not assigned" : row[2])
      done = (row[3].nil? ? false : row[3])
      @recipes << Recipe.new(
        name: row[0],
        description: row[1],
        prep_time: prep_time,
        done: done
      )
    end
  end

  def store_to_csv
    CSV.open(@filepath, 'wb') do |csv|
      csv << ["name", "description", "prep_time", "done?"]
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.prep_time, recipe.done]
      end
    end
  end
end
