class Menu
  def initialize
    @options = {
      0 => { label: 'exit', action: -> {} },
      1 => { label: 'new', action: -> { new } },
      2 => { label: 'all', action: -> { all } },
      3 => { label: 'search', action: -> { search } },
      4 => { label: 'delete' , action: -> { delete } },
      5 => { label: 'search_by_id' , action: -> { get } },
      6 => { label: 'update' , action: -> { update } }
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
    puts "Search Term: "
    search_term = gets.chomp
    products = Product.search(search_term)
    products.each { |product| puts product}
  end

  def get
    puts "Item ID: "
    item_id = gets.chomp.to_i
    puts  Product.get_item_by_id(item_id)
  end

  def delete
    puts "Delete item id: "
    id_to_delete = gets.chomp.to_i
    result = Product.delete(id_to_delete)
    puts result > 0 ? "Deleted with success" : "Register Not Found"
  end

  def update
    puts "Update item id: "
    id_to_update = gets.chomp.to_i

    puts "Which Column?: "
    columns = Product.columns_name.select{ |value, index| value != "id"}
    columns.each_with_index { |value, index| puts "#{index}: #{value}" }
    column_id = gets.chomp.to_i

    puts "New Value? "
    new_value = gets.chomp
    Product.update(id: id_to_update, column_name: columns[column_id], new_value: new_value)
  end

end