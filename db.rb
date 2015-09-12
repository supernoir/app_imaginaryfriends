# REQUIRE
require 'mongoid'
#require 'mongoid/grid_fs'

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
  field :image, type: String
  field :image_name, type: String
  store_in collection: "characters", database: "library"
end
