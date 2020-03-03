require("pg")
class PropertyTracker
  attr_accessor(:address, :value, :bedrooms, :year_built)
  attr_reader(:id)
  def initialize(options)

    @id = options["id"].to_i() if options["id"]
    @address = options["address"]
    @value = options["value"].to_i()
    @bedrooms = options["bedrooms"].to_i()
    @year_built = options["year_built"].to_i()

  end
  def save()
    db = PG.connect({dbname: "property_tracker", host: "localhost" })
    sql = "INSERT INTO property_tracker
            (address, value, bedrooms, year_built)
          VALUES
            ($1, $2, $3, $4)
          RETURNING *"
    values = [ @address, @value, @bedrooms, @year_built ]
    db.prepare( "save", sql )
    @id = db.exec_prepared( "save", values)[0]["id"].to_i()
    db.close()

  end

  def delete()

    db = PG.connect({dbname: "property_tracker", host: "localhost" })
    sql = "DELETE FROM property_tracker WHERE id = $1"
    values = [ @id]
    db.prepare( "delete", sql )
    db.exec_prepared( "delete", values )
    db.close()

  end

  def self.all()

    db = PG.connect({dbname: "property_tracker", host: "localhost" })
    sql = "SELECT * FROM property_tracker"
    db.prepare( "all", sql )
    result = db.exec_prepared( "all" )
    db.close()
    return result.map { |property| PropertyTracker.new(property)   }

  end

  def self.delete_all()

    db = PG.connect({dbname: "property_tracker", host: "localhost" })
    sql = "DELETE FROM property_tracker"
    db.prepare( "delete_all", sql )
    db.exec_prepared( "delete_all" )
    db.close()

  end

end