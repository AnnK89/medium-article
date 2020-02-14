require_relative 'cookbook'
require_relative 'view'
require 'pry-byebug'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_list
  end

  def create
    name = @view.ask_user_for_name
    description = @view.ask_user_for_description
    new_recipe = Recipe.new(name, description)
    @cookbook.add_recipe(new_recipe)
  end

  def destroy
    display_list
    index = @view.ask_user_for_index
    @cookbook.remove_recipe(index)
  end

  private

  def display_list
    recipes = @cookbook.all
    @view.display(recipes)
  end
end
