# This file contains methods related to your store and its supplies.
# You should complete it according to the instructions in the TODO comments

def store_items
  # TODO: find the correct data structure to hold the shopping store items
  # instead of using nil below
  store = {
    "yogurts" => 2,
    "meat" => 7,
    "vegetables" => 5,
    "potatoes" => 2,
    "rice" => 1
  }

  store
end

def product_in_store?(product)
  # TODO: Check whether product is present in ..the store items
  store_items.key?(product)
end

def price_of_product(product)
  # TODO: Return the price of the given product, if it's in store. nil otherwise
  if store_items.key?(product) == true
    store_items[product]
  else
    return nil
  end
end

def store_items_to_s
  items = []
  store_items.each do |store_item, price|
    items << "- #{store_item}: #{price} €"
  end
  items.join("\n")
end
