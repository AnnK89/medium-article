require_relative 'view'
require_relative 'cookbook'
require_relative 'scraper'
require 'pry-byebug'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
    @scraper = Scraper.new
  end

  def list(index = false)
    recipes = @cookbook.all
    @view.display(recipes, index)
  end

  def create
    name = @view.ask_for_input("Please enter the recipe name")
    description = @view.ask_for_input("Please describe the recipe")
    prep_time = @view.ask_for_input("Please enter the prep time")
    new_recipe = Recipe.new(name: name, description: description, prep_time: prep_time)
    @cookbook.add_recipe(new_recipe)
    list
  end

  def destroy
    list(true)
    index = @view.ask_for_input("Please select the index")
    @cookbook.remove_recipe(index.to_i - 1)
  end

  def import
    search_for_recipes
    index = @view.ask_for_input("Please select the index")
    @scraper.select_recipe(index.to_i - 1)
    attrs_hash = @scraper.recipe_attributes
    new_recipe = Recipe.new(attrs_hash)
    @cookbook.add_recipe(new_recipe)
    list
  end

  def mark
    list
    index = @view.ask_for_input("Please select the index")
    @cookbook.mark_as_done(index.to_i - 1)
    list
  end

  private

  def search_for_recipes
    keyword = @view.ask_for_input("What ingredient would you like a recipe for?")
    @scraper.fetch_recipes(keyword)
    @view.show_search_results(@scraper.fetch_titles)
  end
end
