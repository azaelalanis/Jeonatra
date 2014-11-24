# Jeonatra
# Jeopardy on top of sinatra, ruby, and javascript

require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' #database configuration

class Jeonatra < Sinatra::Base; end;
require './helpers' #helper functions
require './config/config'
Dir['controllers/*.rb'].each { |controller| require_relative controller } #load controllers
Dir['models/*.rb'].each { |model| require_relative model } #load all models

class Jeonatra
  get '/' do
    if logged_in?
      erb :dashboard
    else
      erb :login
    end
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

  get '/profiles/:profile/edit' do
    erb :editProfile
  end

  get '/students/new' do
    erb :addStudents
  end

  get '/game/new' do
    erb :newGameOptions
  end
end
