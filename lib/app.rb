require_relative 'models/searcheable'
require_relative 'models/jsonable'
require_relative 'models/product'
require_relative 'models/menu'
class App
 
  def self.call

    # Product.new(name: "Funko", price: 50)
    # Product.new(name: "Funko2", price: 500)
    # Product.new(name: "Funko3", price: 100)

    # Product.all.first.as_json
    # # {name: "funko", price: 50}
    # binding.irb
    # Product.search(5)
    # Product.search('o')

    # # menu
    Menu.call
    "running"
  end
    
end

App.call