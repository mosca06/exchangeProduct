class Product
  extend Searcheable
  include Jsonable

  @@data_set = []
  attr_accessor :id, :name, :price

  def initialize( name: nil, price: nil)
    @name = name
    @price = price
    Database.add_item(self.as_json, 'product')
  end

  def self.all
    Database.all("product")
  end

  def values
    self.instance_variables.map { |var| self.instance_variable_get(var) }
  end

  def keys
    self.instance_variables.map { |var| var.to_s.delete('@').to_sym }
  end

  def self.reset_data_set
    @@data_set = []
  end
end