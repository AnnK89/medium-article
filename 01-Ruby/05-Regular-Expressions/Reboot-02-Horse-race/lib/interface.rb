# TODO: you can build your horse race program here!

puts "Welcome to the horse race."

# def winning_message
#   puts "You won!"
# end

# def losing_message
#   puts "You lost!"
# end


puts "Please select a horse:"

horses = ["Black", "White", "Brown", "Stripe"]
horses_array = []
horses.each { |horse| horses_array << horse }
puts horses_array.join(', ')
print "> "

user_money = 100
while user_money > 0

  user_bet = gets.chomp
  break if user_bet == "exit"

  unless horses.include?(user_bet)
    p "Please select a horse from the list." and next
  end

  if user_bet == horses.sample
    puts "You won! You have $#{user_money += 50}"
  else
    puts "You lost! You have $#{user_money -= 10}"
  end

end
