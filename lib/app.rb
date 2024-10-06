require_relative 'models/product'
class App
  OPTIONS = [
    'exit',
    'new',
    'all',
    'search'
  ]
  def self.call
    Product.new(name: "Funko", price: 50)
    Product.new(name: "Funko2", price: 500)
    Product.new(name: "Funko3", price: 100)

    Product.all.first.as_json
    # {name: "funko", price: 50}
    binding.irb
    Product.search(5)
    Product.search('o')
      
    # menu
    "running"
  end

  def self.menu
    continue = true
    while continue
      system('clear')
      puts "MENU"
      puts "Escolha a opção desejada"
      OPTIONS.each_with_index { |option, index| puts "#{index}: #{option}"}
      option = gets.chomp.to_i

      case option
        when 1
          puts "Name of product: "
          name = gets.chomp
          puts "Price of product: "
          price = gets.chomp.to_i
          Product.new(name: name, price: price)
        when 2
          products = Product.all
          products.each { |product| puts product.as_json}
        when 3
          puts "Search: "
          search = gets.chomp
          products = Product.search(search)
          products.each { |product| puts product.as_json}
      end
      continue = false if option.zero?
      puts "Press any key to continue..."
      gets
    end
  end
end

App.call