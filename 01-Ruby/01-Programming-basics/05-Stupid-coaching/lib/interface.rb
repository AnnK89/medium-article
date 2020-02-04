require_relative "coach_answer"
# TODO: Implement the program that makes you discuss with your coach from the terminal.
puts "Hello there."
input = gets.chomp

while input != "I am going to work right now!"
  if input == input.upcase
    if input == "I AM GOING TO WORK RIGHT NOW!"
      break
    else
      puts coach_answer_enhanced(input)
    end
  else
    puts coach_answer(input)
  end
  input = gets.chomp
end
