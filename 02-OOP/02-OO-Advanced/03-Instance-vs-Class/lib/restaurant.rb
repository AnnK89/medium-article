class Restaurant
  # TODO: add relevant accessors if necessary
  attr_reader :city

  def initialize(city, name)
    # TODO: implement constructor with relevant instance variables
    @city = city
    @name = name
    @ratings = []
  end

  def rate(new_rate)
    @ratings << new_rate
  end

  def average_rating
    @ratings.reduce(:+).fdiv(@ratings.length)
  end

  def self.filter_by_city(restaurants, city)
    restaurants.select { |restaurant| restaurant.city == city }
  end
end
