require_relative 'restaurant'

pastamania = Restaurant.new("Italian", "Low", 9)
dingtaifung = Restaurant.new("Chinese", "High", 11)

p pastamania.restaurant_open?
p dingtaifung.restaurant_open?
