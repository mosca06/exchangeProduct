module Jsonable

  def as_json
    hash = {}
    keys.zip(values).each do |key,value|
      hash[key] = value
    end
    hash
  end
  
  def values
    self.instance_variables.map { |var| self.instance_variable_get(var) }
  end

  def keys
    self.instance_variables.map { |var| var.to_s.delete('@').to_sym }
  end
  
end