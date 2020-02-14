class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} --- #{recipe.name}"
      puts recipe.description
    end
  end

  def ask_user_for_name
    puts "What's the name of your recipe?"
    gets.chomp
  end

  def ask_user_for_description
    puts "Please describe your recipe"
    gets.chomp
  end

  def ask_user_for_index
    puts "Please select the index to delete."
    return gets.chomp.to_i
  end
end
