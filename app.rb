require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' #database configuration

set :views, settings.root + '/vistas'

Dir['models/*.rb'].each do |model|
  require_relative model
end

get '/' do
  erb :login
end

get '/topics' do
  erb :topicList
end

get '/topics/:topic/categories' do
  erb :categoriesByTopic
end

get '/categories/:category/clues' do
  erb :cluesByCategory
end

get '/dashboard' do
  erb :dashboard
end

get '/profiles/:profile/edit' do
  erb :editProfile
end

get '/students/new' do
  erb :addStudents
end

get '/game/new' do
  erb :newGameOptions
end
