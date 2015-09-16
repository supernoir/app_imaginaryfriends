# Imaginary Friends

## General
require 'sinatra'
require 'json'
require 'yaml/store'


## MODULES
require './db'

## File Structure
set :public_folder, 'public'

## RANDOMIZER
# Change class Array to include method random_element
class Array
  def random_element
    self[rand(length)]
  end
end

## FIRST NAMES
# This should eventually read from db or json
all_first_names_male = ["Thomas","Ahmed","Steven","Benyamin","Peter","Arik","Roberto","Jean"]
all_first_names_female = ["Maria","Aisha","Brigitte","Rachel","Helena","Erika","Kristen","Anne"]

## LAST NAMES
# This should eventually read from db or json
all_last_names = ["Brooks","Gagarin","Olivier","Cohen","King","Peterson","Gutierrez","Alonso"]

# Randomize
sample_first_name_male = all_first_names_male.random_element
sample_first_name_female = all_first_names_female.random_element
sample_last_name = all_last_names.random_element

## VIEWS

get '/' do
  @title = 'Imaginary Friends App'
  erb :index
end

get '/new_character' do
  @sample_first_name_male = sample_first_name_male
  @sample_first_name_female = sample_first_name_female
  @sample_last_name = sample_last_name
  @title = 'Create a new character!'
  erb :new_character
end

post '/create_character' do

  gender = params[:gender]
  first_name = params[:first_name]
  last_name = params[:last_name]
  age = params[:age]
  origin = params[:origin]
  image = params[:image]
  image_name = params[:image_name]

  Character.create!(first_name: first_name, last_name: last_name, age: age, origin: origin, image: image, image_name: image_name)

  erb :new_character
  redirect :my_characters
end

get '/my_characters' do
  @title = 'My Characters'
  @characterlist = Character.all
  erb :my_characters
end

get '/view_character/:id' do |id|
  character_by_id = params[:id]
  @display_character = Character.where({id: character_by_id})
  @title = 'Viewing ' + character_by_id
  erb :view_character
end

get '/edit_character/:id' do |id|
  id = params[:id]
  @this_character = id

  character = Character.find(id)
  @current_firstname = character.first_name
  @current_lastname = character.last_name
  @current_origin = character.origin
  @current_age = character.age

  @title = 'Editing #Name'
  erb :edit_character
end

post '/modify_character/:id' do |id|

  id = params[:id]
  gender = params[:gender]
  first_name = params[:first_name]
  last_name = params[:last_name]
  age = params[:age]
  origin = params[:origin]
#  image = params[:image]


  character = Character.find(id)
  character.update({first_name: first_name, last_name: last_name, age: age, origin: origin})



  erb :edit_character
  redirect :my_characters
end


get '/find_character' do
  @title = 'Find a character!'
  erb :find_character
end

get '/find_character_results' do
  @title = 'Character search results'
  find_character = params[:find_character]
  @character_found = Character.or({first_name: find_character},{last_name: find_character})
  erb :find_character_results
end
