require('pg')

class Bounty
  attr_accessor :name, :species, :bounty_value, :fave_weapon
  attr_reader :id

  def initialize( options )
    @name = options['name']
    @species = options['species']
    @bounty_value = options['bounty_value']
    @fave_weapon = options['fave_weapon']
    @id = options['id'].to_i if options['id']
  end

  def save()
    # connect to db
      db = PG.connect( {dbname: 'bounty',
                        host: 'localhost'} )
    # write big sql statement
      sql = "INSERT INTO bounty
      (
        name,
        species,
        bounty_value,
        fave_weapon
      )
      VALUES
      ($1, $2, $3, $4)
      "
      values = [@name, @species, @bounty_value, @fave_weapon]
    # execute
      db.prepare("save", sql)
    # close db
      db.exec_prepared("save", values)
      db.close()
  end

  def Bounty.all()
      db = PG.connect ( {dbname: 'bounty',
                        host: 'localhost'})
      sql = "SELECT * FROM bounty"
      db.prepare("all", sql)
      bounties = db.exec_prepared("all")
      return bounties.map { |bounty| Bounty.new(bounty) }
      db.close()
  end

  def update()
    db = PG.connect ( {dbname: 'bounty',
                      host: 'localhost'})
    sql = "UPDATE bounty
    SET (
      name,
      species,
      bounty_value,
      fave_weapon
    ) =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@name, @species, @bounty_value, @fave_weapon, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
  end

  def Bounty.delete_all()
    db = PG.connect( { dbname: 'bounty',
                      host: 'localhost'})
    sql = "DELETE from bounty"
    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all")
    db.close()
  end

  def delete()
    db = PG.connect( { dbname: 'bounty',
                        host: 'localhost'} )
    sql = "DELETE FROM bounty WHERE id = $1"
    values = [@id]
    db.prepare("delete_one", sql)
    db.exec_prepared("delete_one", values)
    db.close()
  end
  # 
  # def Bounty.find_by_name(name)
  #   db = PG.connect( { dbname: 'bounty',
  #                     host: 'localhost'})
  #   sql = "SELECT FROM bounty WHERE name = $1"
  #   db.prepare("find_by_name", sql)
  #   db.exec_prepared("find_by_name", name)
  #   return name
  #   db.close()
  # end

end
