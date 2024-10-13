class Product < Record
  
  attr_accessor :id, :name, :price

  def initialize( name: nil, price: nil)
    @name = name
    @price = price
  end
end
