class Menu
  def initialize
    @options = [
      'exit',
      'new',
      'all',
      'search'
    ]
    @continue = true
  end

  def self.call
    new.call
  end

  def call
    run
  end

  private

  def run 
    while @continue
      system('clear')
      puts "MENU"
      puts "Escolha a opção desejada"
      @options.each_with_index { |option, index| puts "#{index}: #{option}"}
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
      @continue = false if option.zero?
      puts "Press any key to continue..."
      gets
    end
  end
end