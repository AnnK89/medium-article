require_relative "croupier"

# TODO: make the user play from terminal in a while loop that will stop
#       when the user will not be asking for  a new card

puts "Hello there. Card? 'y' or 'yes' to get a new card"
user_input = gets.chomp

score = 0
bank = pick_bank_score

while ["y", "yes"].include? user_input
  # user_input == 'y' || user_input == 'yes'
  score = pick_player_card + score
  puts state_of_the_game(score, bank)
  puts "Card? 'y' or 'yes' to get a new card"
  user_input = gets.chomp
end

puts end_game_message(score, bank)
