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

  @newfirstname = $first_name
  @newlastname = $last_name
  @newage = $age
  @neworigin = $origin
  
  erb :new_character
end


def add_new_characters 
  #newfirstname = yield
  $character = {"First Name" => $first_name, "Last Name" => $last_name, "Age" => $age, "Origin" => $origin}
end
add_new_characters

def write_character($character)
  characters = read_characters()
  characters << $character
  f = File.open("characters.json", "w") 
  f << characters.to_json
  f.close
end
write_character