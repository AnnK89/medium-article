class View
  def display(recipes, index = false)
    if index
      recipes.each_with_index do |recipe, num|
        puts "#{num + 1} --- #{recipe.name}"
        puts recipe.description
      end
    else
      recipes.each { |recipe| puts recipe.name }
    end
  end

  def ask_for_input(message)
    puts message
    gets.chomp
  end

  # def ask_user_for_name
  #   puts "What's the name of your recipe?"
  #   gets.chomp
  # end

  # def ask_user_for_description
  #   puts "Please describe your recipe"
  #   gets.chomp
  # end

  # def ask_user_for_index
  #   puts "Please select the index to delete."
  #   return gets.chomp.to_i
  # end
end
