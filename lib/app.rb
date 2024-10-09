require_relative 'models/searcheable'
require_relative 'models/jsonable'
require_relative 'models/product'
require_relative 'models/menu'
require_relative 'models/database'
class App
 
  def self.call

    Product.new(name: "Funko", price: 50)
    Product.new(name: "Funko", price: 500)
    Product.new(name: "Funko", price: 100)

    Menu.call
    "running"
  end
    
end

App.call