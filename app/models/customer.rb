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
