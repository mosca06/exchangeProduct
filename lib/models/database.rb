class Database

  def self.add_item(item, database)
    id = last_id(database) + 1
    item = { id: id }.merge(item)
    File.open(file_path(database) , 'a') do |file|
      file.puts item
    end
  end

  def self.all(database)
    all_itens = []
    File.readlines(file_path(database)).each do |line|
      all_itens << eval(line)
    end
    all_itens
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