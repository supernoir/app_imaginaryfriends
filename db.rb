# REQUIRE
require 'mongoid'

# client = Mongo::Client.new([ 'localhost:27017' ], :database => 'library')
# artists = client[:artists]

Mongoid.configure do |config|
  config.sessions = {
    :default => {
      :hosts => ["localhost:27017"], :database => "library"
    }
  }
end

class Character
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :age, type: String
  field :origin, type: String
#  field :image, type: String
  store_in collection: "characters", database: "library"
end

#Character.create!(first_name: 'Conny', last_name: 'Kawohl', origin: 'Bremen')
#puts Character.last.inspect
#p = Character.last
#puts p.first_name
