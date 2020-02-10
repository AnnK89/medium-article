# TODO: you can build your calculator program here!

def calculation(operator, first, second)
  "Result: #{first.send(operator.to_sym, second)} "
end

def ask_for_input(ordinal)
  puts "Enter a #{ordinal} number:"
  print "> "
  variable = gets.chomp.to_f
end

puts "Hello there!"

while true

  first_num = ask_for_input("first")
  second_num = ask_for_input("second")

  puts "Choose an operation: [+][-][*][/]"
  print "> "
  user_operation = gets.chomp


  puts calculation(user_operation, first_num, second_num)

  puts "Do you want to calculate again? [Y/N]"
  break if gets.chomp == "N"

end
