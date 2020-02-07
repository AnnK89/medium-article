DISHES_CALORIES = {
  "Hamburger" => 250,
  "Cheese Burger" => 300,
  "Big Mac" => 540,
  "McChicken" => 350,
  "French Fries" => 230,
  "Salad" => 15,
  "Coca Cola" => 150,
  "Sprite" => 150
}

MEAL_CALORIES = {
  "Happy Meal" => ["Cheese Burger", "French Fries", "Coca Cola"],
  "Best Of Big Mac" => ["Big Mac", "French Fries", "Coca Cola"],
  "Best Of McChicken" => ["McChicken", "Salad", "Sprite"]
}



def poor_calories_counter(burger, side, beverage)
  DISHES_CALORIES[burger] + DISHES_CALORIES[side] + DISHES_CALORIES[beverage]
end

def calories_counter(orders)
  total = 0
  orders.each do |food|
    if MEAL_CALORIES.key?(food)
      meal_array = MEAL_CALORIES[food]

      total += poor_calories_counter(meal_array[0], meal_array[1], meal_array[2])

    else
      total += DISHES_CALORIES[food]
    end
  end
  return total
end

# p calories_counter(["Best Of Big Mac", "Salad", "Happy Meal", "Sprite"])
