require 'csv'
require 'nokogiri'
require 'open-uri'
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

  def filter(keyword)
    url = "https://www.marmiton.org/recettes/recherche.aspx?aqt=#{keyword}"
    html_doc = Nokogiri::HTML(open(url), nil, 'utf-8')

    results = []
    html_doc.search('.recipe-card').first(5).each do |recipe|
      name = recipe.search('.recipe-card__title').text.strip
      description = recipe.search('.recipe-card__description').text.strip
      prep_time = recipe.search('.recipe-card__duration__value').text.strip
      results << Recipe.new(name: name, description: description, prep_time: prep_time)
    end
    results
  end

  def mark_as_done(index)
    @recipes[index].mark_as_done!
    store_to_csv
  end

  private

  def load_csv
    CSV.foreach(@filepath) do |row|
      @recipes << Recipe.new(
        name: row[0],
        description: row[1],
        prep_time: row[2],
        done: row[3]
      )
    end
  end

  def store_to_csv
    CSV.open(@filepath, 'w') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.prep_time, recipe.done]
      end
    end
  end
end
