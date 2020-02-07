def poor_calories_counter(burger, side, beverage)
  # TODO: return number of calories for this mcDonald order
  # Create a poor_calories_counter that returns the total number of calories for the three items of your order.
  burger_calories = MCD_MENU[burger]
  side_calories = MCD_MENU[side]
  beverage_calories = MCD_MENU[beverage]

  return burger_calories + side_calories + beverage_calories
end

# For example poor_calories_counter("McChicken", "French Fries", "Sprite") should return 730.

MCD_MENU = {
  "Hamburger" => 250,
  "Cheese Burger" => 300,
  "Big Mac" => 540,
  "McChicken" => 350,
  "French Fries" => 230,
  "Salad" => 15,
  "Coca Cola" => 150,
  "Sprite" => 150
}

# p poor_calories_counter("McChicken", "French Fries", "Sprite")
