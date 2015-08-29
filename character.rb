

# Assembles a single character with the data supplied by the user

#REQUIRE
require 'mongoid'

Mongoid.configure do |config|
  config.sessions = {
    :default => {
      :hosts => ["localhost:27017"], :database => "test"
    }
  }
end

class Restaurant
  include Mongoid::Document
  field :borough, type: String
  field :cuisine, type: String
  field :name, type: String
  store_in collection: "restaurants", database: "test"
end

Restaurant.create!(name: 'Whatsup')
puts Restaurant.all




def assemble_characters()
  characterid = SecureRandom.uuid
  character = {"Character ID" => @characterid, "First Name" => @first_name, "Last Name" => @last_name, "Age" => @age, "Origin" => @origin, "Image" => @image}
  write_character(character)
end

# Read the JSON File and parse it into a hash
def read_characters()
  readfile = File.read("characters.json")
  return JSON.parse(readfile)
end

# Reads the Characters JSON file and appends the new character
def write_character(character)
  characters = read_characters()
  characters << character
  f = File.open("characters.json", "w")
  f << characters.to_json
  f.close
end
