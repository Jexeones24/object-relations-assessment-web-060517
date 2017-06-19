
class Review
  attr_writer :customer

  @@all = []

  def initialize(restaurant, content)
    @restaurant = restaurant
    @content = content
    @@all << self
  end

  def self.all
    @@all
  end

  #returns the customer for that given review
  def customer
    @@all.select {|review| self.restaurant.customers}
  end

  #returns the restaurant for that given review
  def restaurant
    @restaurant
  end

end
