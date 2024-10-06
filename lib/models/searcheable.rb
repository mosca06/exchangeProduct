module Searcheable
  
  def search(value)
    search_result = []
    all.each do |item| 
      attributes_values = item.values
      attributes_values.each do |attribute_value|
        if attribute_value.to_s.include?(value.to_s) && !search_result.include?(item)
          search_result << item
          break 
        end
      end
    end
    search_result
  end
  
end