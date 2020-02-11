# TODO: you can build your christmas list program here!
require_relative './methods.rb'
require_relative './csv.rb'
require 'csv'

puts "Welcome to your Christmas gift list"

user_input = ""
user_gift_list = show_database


while user_input != "quit"
  puts "Which action [list|add|delete|mark|idea|quit]?"
  user_input = gets.chomp.downcase

  if user_input == "list"
    list_gift(user_gift_list)
  elsif user_input == "add"
    puts "What item would you like to add to the list?"
    user_input = gets.chomp
    add_gift(user_gift_list, user_input)
    update_database(user_gift_list)
  elsif user_input == "delete"
    delete_gift(user_gift_list)
  elsif user_input == "mark"
    mark_gift(user_gift_list)
  elsif user_input == "idea"
    suggest_idea(user_gift_list)
  elsif user_input != "quit"
    puts "Please select an action from the list"
  end
end

puts "Goodbye"
