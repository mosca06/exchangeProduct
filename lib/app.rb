class App
  def self.call
    Product.new(name: "Funko", price: 50)
    Product.new(name: "Funko2", price: 500)
    Product.new(name: "Funko3", price: 100)

    Product.all

    'running'
  end
end