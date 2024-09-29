class Product
  @@data_set = []
  attr_accessor :name, :price

  def initialize(name: nil, price: nil)
    @name = name
    @price = price
    @@data_set << self
  end

  def self.all
    @@data_set
  end

  def as_json
    hash = {}
    keys = self.instance_variables.map {|var| var.to_s.delete('@').to_sym}
    values = self.instance_variables.map {|var| self.send(var.to_s.delete('@').to_sym) }
    keys.zip(values).each do |key,value|
      hash[key] = value
    end
    hash
  end
end