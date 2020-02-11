require 'nokogiri'
require 'open-uri'

def list_gift(user_gift_list)
  puts "Your list is empty. Please add an item." if user_gift_list.empty?

  user_gift_list.each_with_index do |kv_pair, index|
    if kv_pair[:status] == true
      puts "#{index + 1} - [X] #{kv_pair[:name]}"
    else
      puts "#{index + 1} - [ ] #{kv_pair[:name]}"
    end
    # "#{index + 1} - [#{kv_pair[:status] ? 'X' : ' '}] #{kv_pair[:name]}"
  end
end

def add_gift(user_gift_list, gift_name)
  user_gift_list << { name: gift_name, status: false }
  puts "You have added #{user_gift_list[user_gift_list.length - 1][:name]} to your list."
end

def delete_gift(user_gift_list)
  puts "Please select the item number to delete"
  user_input = gets.chomp.to_i - 1
  user_gift_list.delete_at(user_input)
  update_database(user_gift_list)
end

def mark_gift(user_gift_list)
  puts "Please select the number of the item have you bought"
  user_input = gets.chomp.to_i - 1
  user_gift_list[user_input][:status] = !user_gift_list[user_input][:status]
  update_database(user_gift_list)
end

def scrape_data(keyword)
  url = "https://www.etsy.com/sg-en/search?q=#{keyword}"
  html_content = open(url).read
  doc = Nokogiri::HTML(html_content)

  data_array = []

  doc.search('.text-gray.text-truncate.mb-xs-0.text-body').take(5).each do |element|
    data_array << element.text.strip
  end

  data_array
end

def suggest_idea(user_gift_list)
  puts "What are you looking for on Etsy?"
  user_input = gets.chomp

  search_results = scrape_data(user_input)
  search_results.each_with_index do |idea, index|
    puts "#{index + 1}. #{idea}"
  end

  puts "Pick one to add to your list"
  user_choice = gets.chomp.to_i - 1
  add_gift(user_gift_list, search_results[user_choice])
  update_database(user_gift_list)
end
