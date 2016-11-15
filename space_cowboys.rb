require('pg')

class SpaceCowboy
  attr_accessor :name, :species, :bounty, :last_known_location
  attr_reader :id

  def initialize( options )
    @name = options['name']
    @species = options['species']
    @bounty = options['bounty'].to_i
    @last_known_location = options['last_known_location']
    @id = options['id'].to_i if options['id']
  end

  def save
    db = PG.connect( { dbname: 'space_cowboys', host: 'localhost' } )
    cowboys = "
    INSERT INTO space_cowboys
    (name, species, bounty, last_known_location)
    VALUES
    ('#{@name}', '#{@species}', #{@bounty}, '#{@last_known_location}') returning *;"
    result = db.exec(cowboys)
    @id = result[0]['id'].to_i
    db.close
  end

  def update
    db = PG.connect( { dbname: 'pizza_shop', host: 'localhost' } )
    updating = 
    "UPDATE space_cowboys
    SET (name, species, bounty, last_known_location)=
    ('#{@name}', '#{@species}', #{@bounty}, '#{@last_known_location}')
    WHERE id = #{@id};"
    db.exec(updating)
    db.close
  end

  def self.all
    db = PG.connect( { dbname: 'space_cowboys', host: 'localhost' } )
    sql =
    "SELECT * FROM space_cowboys;"
    cowboys = db.exec(sql)
    db.close
    return cowboys.map { |order_hash| SpaceCowboy.new(order_hash) }
  end

  def self.delete_all
    db = PG.connect( { dbname: 'space_cowboys', host: 'localhost' } )
    db.exec("DELETE FROM space_cowboys;")
    db.close
  end

end