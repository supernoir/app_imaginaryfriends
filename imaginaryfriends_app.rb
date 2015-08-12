# Imaginary Friends


## REQUIRE - General
require 'sinatra'
require 'json'
require 'yaml/store'
require 'rubygems'


## Require - App Modules
require './character'

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


  $first_name = params[:first_name]
  $last_name = params[:last_name]
  $age = params[:age]
  $origin = params[:origin]
  $image = params[:image][:filename]

  @newfirstname = $first_name
  @newlastname = $last_name
  @newage = $age
  @neworigin = $origin
  @image = $image

  assemble_characters

  erb :new_character
  redirect :my_characters
end

#CHARACTER.RB

get '/my_characters' do
  @title = 'My Characters'
  @characterlist = read_characters()
  erb :my_characters
end
