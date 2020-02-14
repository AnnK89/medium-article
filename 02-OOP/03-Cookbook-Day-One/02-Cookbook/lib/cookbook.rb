require 'csv'
require 'pry-byebug'
require_relative 'recipe'


class Cookbook
  def initialize(csv_file_path)
    @recipes = []
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
    @recipes.delete_at(recipe_index - 1)
    store_to_csv
  end

  private

  def load_csv
    CSV.foreach(@filepath) do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
  end

  def store_to_csv
    CSV.open(@filepath, 'w') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
