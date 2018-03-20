# build out the methods to save and find pokemon in the database.
require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id:, name:, type:, db:, hp: nil)
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
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).first
# binding.pry
    self.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], hp: pokemon[3], db: db)
    #  hp: pokemon[3])
    # @db=nil, @hp=nil, @id=nil, @name=nil, @type=nil>
    # ("Pikachu", "electric", @db)
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
