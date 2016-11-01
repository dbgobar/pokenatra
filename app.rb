require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative 'db/connection'

require_relative 'models/pokemon'
require_relative 'models/trainer'

get '/trainers' do
  @trainers = Trainer.all
  erb :"trainers/index"
end

get '/pokemons' do
  @pokemons = Pokemon.all
  erb :"pokemons/index"
end

#findtrainer
get '/trainers/new' do
  erb :"trainers/new"
end

get '/trainers/:id' do
  @trainer = Trainer.find(params[:id])
  erb :"trainers/show"
end

#find pokemon
get '/pokemons/new' do
  erb :"pokemons/new"
end

get '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemons/show"
end

#create new trainer
post '/trainers' do
  @trainer = Trainer.create(params[:trainer])
  redirect "/trainers/#{@trainer.id}"
end

#create new pokemon
post '/pokemons' do
  @pokemon = Pokemon.create(params[:pokemon])
  redirect "/pokemons/#{@pokemon.id}"
end

#edit pokemon
get "/pokemons/:id/edit" do
  @pokemon = Pokemon.find(params[:id])
  erb(:"pokemons/edit")
end

put '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.update(params[:pokemon])
  redirect("/pokemons/#{@pokemon.id}")
end

#edit trainer
get "/trainers/:id/edit" do
  @trainer = Trainer.find(params[:id])
  erb(:"trainers/edit")
end

put '/trainers/:id' do
  @trainer = Trainer.find(params[:id])
  @trainer.update(params[:trainer])
  redirect("/trainers/#{@trainer.id}")
end

#delete Pokemon and trainer
delete '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.destroy
  redirect("/pokemons")
end

delete '/trainers/:id' do
  @trainer = Trainer.find(params[:id])
  @trainer.destroy
  redirect("/trainers")
end
