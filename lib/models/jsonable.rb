module Jsonable

  def as_json
    hash = {}
    keys.zip(values).each do |key,value|
      hash[key] = value
    end
    hash
  end
  
end