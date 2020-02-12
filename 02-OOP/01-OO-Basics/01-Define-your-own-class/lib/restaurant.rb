class Restaurant
  def initialize(type, price_range, opening_hour)
    @type = type
    @price_range = price_range
    @opening_hour = opening_hour
  end

  def restaurant_open?
    return @opening_hour
  end
end
