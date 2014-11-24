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
  after { ActiveRecord::Base.connection.close }

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
    erb :crearjuego
  end

  post '/game/' do

  

  @game = Game.new


  if @game.save
    redirect to('/game/#{@game.id}')
  else
    redirect to('/game/new')
  end
  end

  get '/game/:gameid' do
    game = Game.find_by_id(params[:game_id])
    game.topics.each do |topic|
      @categories << topic.categories
    end

    @selected_categories = @categories.sample(6)

    @category1 = @selected_categories[0]
    @category2 = @selected_categories[1]
    @category3 = @selected_categories[2]
    @category4 = @selected_categories[3]
    @category5 = @selected_categories[4]
    @category6 = @selected_categories[5]

    erb :jeopardy, :layout=> :jeopardy_layout
  end

end
