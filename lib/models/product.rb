class Product
  @@data_set = []
  attr_accessor :name, :price

  def initialize(name: nil, price: nil)
    @name = name
    @price = price
    @@data_set << self
  end

  def self.all
    @@data_set
  end
end