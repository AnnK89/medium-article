# TODO: you can build your instacart program here!

STORE = {
  apple: 10,
  pepper: 15,
  meat: 30,
  vegetables: 45
}
puts "Welcome to the store. Please select your item."

STORE.each_with_index do |item_pair, index|
  puts "#{index + 1}. #{item_pair[0]}: $#{item_pair[1]}"
end



def checkout(cart)
  total_amount = 0
  cart_array = []

  cart.each_pair do |item, amount|
    total_amount += (STORE[item] * amount)
  end

  cart.each_pair do |item, amount|
    cart_array << "#{amount} #{item}(s)"
  end

  puts "You have #{cart_array.join(', ')} in your cart."
  puts "Your total amount is $#{total_amount}."
end

cart = {}

while true

  user_item = gets.chomp.to_sym
  return checkout(cart) if user_item == :checkout

  unless STORE.key?(user_item)
    p "Item not in store."
    next
  end

  if cart.key?(user_item)
    cart[user_item] += 1
  else
    cart[user_item] = 1
  end
  puts "Would you like to add another item? Else, type 'checkout'."
end
