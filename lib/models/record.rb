class Record
  include Jsonable
  extend Searcheable

  def self.add_item(item, database)
    id = last_id(database) + 1
    item = { id: id }.merge(item)
    File.open(file_path(database) , 'a') do |file|
      file.puts item
    end
  end

  def self.create(**kwargs)
    object = self.new(**kwargs)
    add_item(object.as_json, table_name)
  end

  def self.delete_item(id, database)
    all_items = File.readlines(file_path(database)).select { |line| eval(line)[:id] != id }
    File.open(file_path(database), 'w') do |file|
      all_items.each { |item| file.puts(item) }
    end
  end

  def self.all
     File.readlines(file_path(table_name)).map { |line| eval(line) }
  end

  private 

  def self.last_id(database)
    line = last_line(database)
    line.nil? ? 0 : eval(line)[:id] 
  end

  def self.last_line(database)
    File.readlines(file_path(database)).last
  end

  def self.file_path(database)
    path = "lib/database/#{database}.csv"
    create_path(path) unless File.exist?(path)
    path
  end

  def self.create_path(path)
    File.new(path, "w")
  end

  def self.table_name
    self.to_s.downcase
  end

end