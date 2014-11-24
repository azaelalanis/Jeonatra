# Jeonatra
# Jeopardy on top of sinatra, ruby, and javascript

require 'sinatra'
require 'sinatra/activerecord'
require 'mail'
require './config/environments' #database configuration

class Jeonatra < Sinatra::Base; end;
require './helpers' #helper functions
require './config/config'
Dir['controllers/*.rb'].each { |controller| require_relative controller } #load controllers
Dir['models/*.rb'].each { |model| require_relative model } #load all models

class Jeonatra
  get '/' do
    if logged_in?
      redirect to('/password')  if current_user.first_login?
      redirect to('/dashboard')
    else
      redirect to('/login')
    end
  end

  get '/dashboard' do
    erb :dashboard
  end

  get '/topics' do
    @topics = Topic.all
    erb :topicList
  end

  post '/topics' do
    #@topics = Topic.all
    erb :topicList
  end

  get '/topics/:topic/edit' do
    @topic = Topic.find_by_id(params[:topic])
    erb :topicEdit
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
