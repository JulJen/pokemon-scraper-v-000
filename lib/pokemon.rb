# build out the methods to save and find pokemon in the database.

class Pokemon

  @@all = []

  def initialize(name, type, db)
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, database_connection)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end
end
