class Product < Record
  
  attr_accessor :id, :name, :price

  def initialize( name: nil, price: nil)
    @name = name
    @price = price
  end

  def self.search(search_term)
    SearchService.call(search_term, Database, Products::SearchQuery)
  end
end
