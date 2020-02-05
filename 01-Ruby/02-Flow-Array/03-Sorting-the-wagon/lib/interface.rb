require_relative "wagon_sort"

# TODO: Ask the user about students to add to the Wagon.
#       Remember, to read an input from the command line, use:
#       - `gets`:  http://www.ruby-doc.org/core-2.5.3/Kernel.html#method-i-gets
#       - `chomp`: http://www.ruby-doc.org/core-2.5.3/String.html#method-i-chomp

puts "Type a student name:"
student_name = gets.chomp
student_array = []
while student_name != ""
  student_array << student_name
  puts "Type another student name or press enter to finish:"
  student_name = gets.chomp
end

sorted_array = wagon_sort(student_array)

sorted_array[sorted_array.length - 1] = "and #{sorted_array.last}"

array_without_last_el = sorted_array.pop

array_to_string = sorted_array.join(", ")

puts "Congratulations! Your Wagon has #{student_array.length} students:"
puts "#{array_to_string} #{array_without_last_el}"

# TODO: Then call `wagon_sort` method defined in the wagon_sort.rb
#       file and display the sorted student list
