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
    keys = self.keys
    values = self.values
    keys.zip(values).each do |key,value|
      hash[key] = value
    end
    hash
  end

  def self.search(value)
    search_result = []
    all.each do |funko| 
      attributes_values = funko.values
      attributes_values.each do |attribute_value|
        if attribute_value.to_s.include?(value.to_s) && !search_result.include?(funko)
          search_result << funko
          break 
        end
      end
    end
    search_result
  end
  

  def values
   self.instance_variables.map { |var| self.instance_variable_get(var) }
  end

  def keys
    self.instance_variables.map {|var| var.to_s.delete('@').to_sym}
  end

  def self.reset_data_set
    @@data_set = []
  end
end