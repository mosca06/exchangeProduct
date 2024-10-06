module Jsonable

  def as_json
    hash = {}
    keys = self.keys
    values = self.values
    keys.zip(values).each do |key,value|
      hash[key] = value
    end
    hash
  end
  
end