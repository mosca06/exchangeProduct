require_relative 'models/validatable'
require_relative 'queries/application_query'
require_relative 'services/application_service'
require_relative 'queries/products/search_query'
require_relative 'services/search_service'
require_relative 'bin/database'
require_relative 'models/postgres_exchanger'
require_relative 'models/csv_exchanger'
require_relative 'models/searcheable'
require_relative 'models/jsonable'
require_relative 'models/record'
require_relative 'models/product'
require_relative 'models/menu'

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