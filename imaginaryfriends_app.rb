# The Suffragist

require 'sinatra'
require 'json'
require 'yaml/store'


get '/' do
  @title = 'Imaginary Friends App'
  erb :index
end

get '/new_character' do
  @title = 'Create a new character!'
  erb :new_character
end

post '/create_character' do
  $first_name = params[:first_name]
  $last_name = params[:last_name]
  $age = params[:age]
  $origin = params[:origin]

  assemble_characters

  @newfirstname = $first_name
  @newlastname = $last_name
  @newage = $age
  @neworigin = $origin

  erb :new_character
end

# Assembles a single character with the data supplied by the user
def assemble_characters
  $character = {"First Name" => $first_name, "Last Name" => $last_name, "Age" => $age, "Origin" => $origin}
  write_character($character)
end

# Read the JSON File and parse it into a hash
def read_characters()
  readfile = File.read("characters.json")
  return JSON.parse(readfile)
end

# Reads the Characters JSON file and appends the new character
def write_character(character)

  characters = read_characters()
  characters << $character
  f = File.open("characters.json", "w")
  f << characters.to_json
  f.close
end
