class PostgresExchanger

  def self.create(**kwargs)
    sql = "
        INSERT INTO #{table_name}(#{kwargs.keys.join(', ')})
        VALUES(#{kwargs.values.map{ |value| "'#{value}'"}.join(', ')})
        RETURNING id
        ;
      "
    result = Database.execute_sql(sql)
    id = result[0]['id'].to_i
    object = self.new(**kwargs)
    object.id = id
    object
  end

  def self.delete(id)
    sql = "
      DELETE FROM #{table_name} 
      WHERE id = #{id}
      ;
    "
    Database.execute_sql(sql).cmd_tuples
  end
 
  def self.all
    sql = "
      SELECT * FROM #{table_name} ORDER BY id
      ;
    "
    Database.execute_sql(sql).to_a
  end

  def self.get_item_by_id(id)
    sql = "
      SELECT * 
      FROM #{table_name}
      WHERE id = #{id}
      ;      
    "
    Database.execute_sql(sql).to_a[0]
  end

  def self.update(**kwargs)
    sql = "
      UPDATE #{table_name}
      SET #{kwargs[:column_name]} = #{kwargs[:new_value]}
      WHERE id = #{kwargs[:id]}
      ;
    "
    result = Database.execute_sql(sql)
    binding.irb
  end

  def self.table_name
    self.to_s.downcase << 's'
  end

  def self.columns_name
    sql = "
      SELECT column_name 
      FROM information_schema.columns
      WHERE table_name = '#{table_name}'
      ;
    "
    Database.execute_sql(sql).map { |column| column['column_name'] }
  end
end