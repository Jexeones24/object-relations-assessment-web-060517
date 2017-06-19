
class Restaurant
  attr_accessor :name, :review

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    @@all.find { |restaurant| restaurant.name == name }
  end

  #returns an array of all reviews for that restaurant
  def reviews
    self.select {|review| restaurant.review }
  end

  #return all of the customers who have written reviews of that restaurant
  #instance of restaurant
  #customer connected to restaurant thru reviews
  def customers
    self.reviews.map {|review| review.customer }
  end

end
