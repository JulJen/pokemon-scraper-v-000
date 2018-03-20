# build out the methods to save and find pokemon in the database.
require 'pry'

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
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
binding.pry
  end
end

# describe ".find" do
#   it 'finds a pokemon from the database by their id number and returns a new Pokemon object' do
#     # The find method creates a new Pokemon after selecting their row from the database by their id number.
#     Pokemon.save("Pikachu", "electric", @db)
#
#     pikachu_from_db = Pokemon.find(1, @db)
#     expect(pikachu_from_db.id).to eq(1)
#     expect(pikachu_from_db.name).to eq("Pikachu")
#     expect(pikachu_from_db.type).to eq("electric")
#   end
# end
