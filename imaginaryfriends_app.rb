# Imaginary Friends

## General
require 'sinatra'
require 'json'
require 'yaml/store'



## App Modules
# require './character'
require './db'



## File Structure
set :public_folder, 'public'

get '/' do
  @title = 'Imaginary Friends App'
  erb :index
end

get '/new_character' do
  @title = 'Create a new character!'
  erb :new_character
end

post '/create_character' do

  first_name = params[:first_name]
  last_name = params[:last_name]
  age = params[:age]
  origin = params[:origin]
#  image = params[:file][:filename]


  Character.create!(first_name: first_name, last_name: last_name, age: age, origin: origin)

  erb :new_character
  redirect :my_characters
end

get '/my_characters' do
  @title = 'My Characters'
  @characterlist = Character.all
  erb :my_characters
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
