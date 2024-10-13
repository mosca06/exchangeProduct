class Menu
  def initialize
    @options = {
      0 => { label: 'exit', action: -> {} },
      1 => { label: 'new', action: -> { new } },
      2 => { label: 'all', action: -> { all } },
      3 => { label: 'search', action: -> { search } },
      4 => { label: 'delete' , action: -> { delete } }
    }
  end

  def self.call
    new.call
  end

  def call
    run
  end

  private

  def run 
    while 
      show_options
      choose_option
      run_option

      check_exit
    end
  end

  def show_options
    system('clear')
    puts "MENU"
    puts "Escolha a opção desejada"
    @options.each { |option| puts "#{option.first} - #{option.last[:label]}"}
  end

  def choose_option
    @option = gets.chomp.to_i
  end

  def run_option
    @options[@option][:action].call
  end

  def check_exit
    exit 0 if @option.zero?
    puts "Press any key to continue..."
    gets
  end

  def all
    products = Product.all
    puts products
  end

  def new
    puts "Name of product: "
    name = gets.chomp
    puts "Price of product: "
    price = gets.chomp.to_i
    Product.create(name: name, price: price)
  end

  def search
    puts "Search: "
    search = gets.chomp
    products = Product.search(search)
    products.each { |product| puts product}
  end

  def delete
    puts "Delete item id: "
    id_to_delete = gets.chomp.to_i
    Record.delete_item(id_to_delete, 'product')
  end

end