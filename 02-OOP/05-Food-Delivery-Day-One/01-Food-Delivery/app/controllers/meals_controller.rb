require_relative '../views/meal_view.rb'

class MealsController
  def initialize(repository)
    @repository = repository
    @view = MealView.new
  end

  def list
    meals = @repository.all
    @view.display(meals)
  end

  def add
    name = @view.ask_for_input("Name of meal?")
    price = @view.ask_for_input("Price?").to_i
    meal = Meal.new(name: name, price: price)
    @repository.add(meal)
  end
end
