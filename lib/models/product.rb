class Product < Record
  
  attr_accessor :id, :name, :price
  validates :name, presence: true, min_length:3
  validates :price, numeric: true, presence: true

  def initialize( name: nil, price: nil)
    @name = name
    @price = price
  end

  def self.search(search_term)
    SearchService.call(search_term, Database, Products::SearchQuery)
  end
end
