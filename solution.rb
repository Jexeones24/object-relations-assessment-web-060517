# Please copy/paste all three classes into this file to submit your solution!
class Customer
  attr_accessor :first_name, :last_name, :reviews

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    @@all.find { |customer| customer.full_name == name }
  end

  def self.find_all_by_first_name(name)
    @@all.select { |customer| customer.first_name == name}
  end

  def self.all_names
    @@all.map { |customer| customer.full_name}
  end

#given some content and a restaurant, creates a new review and associates it with that customer and that restaurant
  def add_review(restaurant, content)
    review = Review.new(restaurant, content)
    review.customer = self
    review.restaurant = restaurant
  end

end



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
