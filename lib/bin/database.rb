require 'pg'
require 'yaml'
require 'date'

class Database

  def initialize
  end

  def self.excecute_sql(sql)
    result = connection.exec(sql)
    connection&.close
    result
  end

  def self.create_tables
    sql = %(
      CREATE TABLE IF NOT EXISTS product (
        id SERIAL PRIMARY KEY,
        name varchar(255) NOT NULL,
        price decimal NOT NULL
      )
    )
  #       created_at date NOT NULL,
  #       updated_at date NOT NULL
    excecute_sql(sql)
  end

  def self.connection
    PG.connect(environment_db_params)
  rescue PG::Error => e
    raise e.message
  end

  def self.environment_db_params
    data = File.read('lib/config/database.yml')

    db = YAML.safe_load(data, aliases: true)

    db[ENV['DATABASE']] || db['development']
  end
end

Database.create_tables