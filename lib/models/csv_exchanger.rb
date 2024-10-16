class CsvExchanger

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

  def self.delete(id)
    all_items = File.readlines(file_path(table_name)).select { |line| eval(line)[:id] != id }
    File.open(file_path(table_name), 'w') do |file|
      all_items.each { |item| file.puts(item) }
    end
  end

  def self.all
    File.readlines(file_path(table_name)).map { |line| eval(line) }
  end

  def self.table_name
    self.to_s.downcase
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
end
