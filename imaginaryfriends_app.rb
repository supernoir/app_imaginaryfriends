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

  File.open('public/images/' + params['image'][:filename], "w") do |f|
      f.write(params['image'][:tempfile].read)
    end

  first_name = params[:first_name]
  last_name = params[:last_name]
  age = params[:age]
  origin = params[:origin]
  image = params[:image][:filename]

  Character.create!(first_name: first_name, last_name: last_name, age: age, origin: origin, image: image )


  erb :new_character
  redirect :my_characters
end

#CHARACTER.RB

get '/my_characters' do
  @title = 'My Characters'
  @characterlist = Character.all
  erb :my_characters
end
