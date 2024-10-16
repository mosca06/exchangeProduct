class Record < PostgresExchanger
  include Jsonable
  extend Searcheable

  def self.create(**kwargs)
   super(**kwargs)
  end

  def self.delete(id)
    super(id)
  end

  def self.search(arg)
    super(arg)
  end

  def self.all
     super
  end
end
