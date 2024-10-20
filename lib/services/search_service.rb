class SearchService < ApplicationService
  def initialize(search_term, database, query)
    @search_term = search_term.to_s
    @database = database
    @query = query.call
  end

  private

  def run
    execute
  end

  def sql
    adjust_query
  end

  def execute
    @database.execute_sql(sql).to_a
  end

  def adjust_query
    @query.gsub(':search_term', @search_term)
  end
end