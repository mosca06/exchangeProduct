module Products
  class SearchQuery < ApplicationQuery
    private

    def run
      "
      SELECT * 
      FROM product
      WHERE name ILIKE '%:search_term%'
      OR price::text ILIKE '%:search_term%'
      OR id::text ILIKE '%:search_term%'
      ;      
    "
    end
  end
end