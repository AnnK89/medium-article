require 'pry-byebug'

class View
  def display(recipes, index = false)
    # binding.pry
    puts "-- Here are all your recipes --"
    puts ""
    if index
      recipes.each_with_index do |recipe, num|
        puts "#{num + 1}. #{recipe.name} (#{recipe.prep_time})"
        puts recipe.description
      end
    else
      name_only(recipes)
    end
  end

  def ask_for_input(message)
    puts message
    print "> "
    gets.chomp
  end

  def print_message(keyword)
    puts "Looking for \"#{keyword}\" recipes on the Internet..."
    puts ""
  end

  def show_search_results(results)
    results.each_with_index { |result, index| puts "#{index + 1}. #{result.text.strip}" }
  end

  def import_title(results, index)
    puts "Importing \"#{results[index].name}\"..."
    return results[index]
  end

  private

  def name_only(recipes)
    recipes.each_with_index do |recipe, index|
      status = recipe.done? ? "[X]" : "[ ]"
      puts "#{index + 1}. #{status} #{recipe.name} (#{recipe.prep_time})"
    end
  end
end
