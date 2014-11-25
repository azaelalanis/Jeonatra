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
  set :method_override, true
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
    @topics = Topic.all
    erb :topicList
  end

  post '/topics/new' do
    @topic = Topic.new(params[:topic])
    if @topic.save
      session[:flash] = "Se ha agregado el topico."
      redirect to('/topics')
    else
      "No se pudo guardar"
    end
  end

  get '/topics/:topic/delete' do
    @topic = Topic.find_by_id(params[:topic])
    @topic.destroy
    session[:flash] = "Se ha elimiando el topico"
    redirect to('/topics')
    erb :topicList
  end

  get '/topics/:topic/edit' do
    @topic = Topic.find_by_id(params[:topic])
    erb :topicEdit
  end

  get '/topics/:topic/categories' do
    @topic = Topic.find_by_id(params[:topic])
    @categories = @topic.categories
    erb :categoriesByTopic
  end

  get '/categories/:category/clues' do
    @category = Category.find_by_id(params[:category])
    @clue1 = @category.clues.find_by_value(200)
    @clue2 = @category.clues.find_by_value(400)
    @clue3 = @category.clues.find_by_value(600)
    @clue4 = @category.clues.find_by_value(800)
    @clue5 = @category.clues.find_by_value(1000)
    erb :cluesByCategory
  end

  post '/categories/:category/clues/update' do
    "#{params[:clues].inspect}"
    @category = Category.find_by_id(params[:category])

    @clue1 = @category.clues.find_by_value(200)
    @clue2 = @category.clues.find_by_value(400)
    @clue3 = @category.clues.find_by_value(600)
    @clue4 = @category.clues.find_by_value(800)
    @clue5 = @category.clues.find_by_value(1000)

    @clue1.update(params[:clues][0])
    @clue2.update(params[:clues][1])
    @clue3.update(params[:clues][2])
    @clue4.update(params[:clues][3])
    @clue5.update(params[:clues][4])

    redirect to("/categories/#{@category.id}/clues")

  end

  post '/categories/new' do
    @category = Category.new(params[:category])
    if @category.save
      session[:flash] = "Se ha agregado la categoria."
      redirect to("/topics/#{@category.topic.id}/categories")
    else
      "No se pudo guardar"
    end
  end

  get '/categories/:category/delete' do
    @category = Category.find_by_id(params[:category])
    url_path = "/topics/#{@category.topic.id}/categories"
    @category.destroy
    session[:flash] = "Se ha elimiando la categoria"
    redirect to(url_path)
  end

  get '/profiles/:profile/edit' do
    erb :editProfile
  end

  get '/classrooms' do
    @classrooms = current_user.classrooms
    erb :classrooms
  end

  post '/classrooms/new' do
    @classroom = Classroom.new(params[:classroom])
    if @classroom.save
      session[:flash] = "Se ha agregado la clase."
      redirect to('/classrooms')
    else
      "No se pudo guardar"
    end
  end

  get '/classrooms/:classroom/delete' do
    @classroom = Classroom.find_by_id(params[:classroom])
    @classroom.destroy
    session[:flash] = "Se ha elimiando la clase"
    redirect to('/classrooms')
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
    #game = Game.find_by_id(params[:game_id])
    #game.topics.each do |topic|
    @categories = []
    Category.all.each do |category|
      @categories << category
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
