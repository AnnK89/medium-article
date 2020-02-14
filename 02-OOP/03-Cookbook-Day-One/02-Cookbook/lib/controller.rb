require_relative 'cookbook'
require_relative 'view'
require 'pry-byebug'

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
    new_recipe = Recipe.new(name, description)
    @cookbook.add_recipe(new_recipe)
  end

  def destroy
    list(true)
    index = @view.ask_for_input("Please select the index")
    @cookbook.remove_recipe(index.to_i)
  end
end
