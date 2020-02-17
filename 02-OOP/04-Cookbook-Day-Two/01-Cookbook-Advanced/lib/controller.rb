require_relative 'cookbook'
require_relative 'view'
require 'pry-byebug'
require 'nokogiri'
require 'open-uri'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
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
  end

  def destroy
    list(true)
    index = @view.ask_for_input("Please select the index")
    @cookbook.remove_recipe(index.to_i)
  end

  def search
    keyword = @view.ask_for_input("What ingredient would you like a recipe for?")
    @view.print_message(keyword)
    results = @cookbook.filter(keyword)
    @view.show_search_results(results)
    index = @view.ask_for_import_index
    recipe = @view.import_title(results, index)
    @cookbook.add_recipe(recipe)
  end

  def mark
    list
    index = @view.ask_for_input("Please select the index")
    @cookbook.mark_as_done(index.to_i - 1)
    list
  end
end
