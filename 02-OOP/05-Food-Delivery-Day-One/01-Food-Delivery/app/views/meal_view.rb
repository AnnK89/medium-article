class MealView
  def ask_for_input(message)
    puts message
    gets.chomp
  end

  def display(meals)
    # array of meal instances
    meals.each { |meal| puts meal.name }
  end
end
