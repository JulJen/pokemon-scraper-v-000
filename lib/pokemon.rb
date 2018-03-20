# build out the methods to save and find pokemon in the database.

class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id = nil, hp = nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?")
  end

end
