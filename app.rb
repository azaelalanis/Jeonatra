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

  post '/topics/:topic/update' do
    @topic = Topic.find_by_id(params[:topic])
    name = params[:name]
    @topic.update(:name => name)
    "Actualizado"
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

  post '/categories/:category/update' do
    @category = Category.find_by_id(params[:category])
    name = params[:name]
    @category.update(:name => name)
    "Actualizado"
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

  get '/classrooms/:classroom/students' do
    @students = Student.all
    erb :studentsByClassroom
  end


  get '/classrooms/:classroom/score' do
    @games = Classroom.find(params[:classroom]).games

    @players = []

    @games.each do |game|
      game.players.each do |player|
        @players << player
      end
    end

    erb :leaderboard

  end


  get '/classrooms/:classroom/delete' do
    @classroom = Classroom.find_by_id(params[:classroom])
    @classroom.destroy
    session[:flash] = "Se ha elimiando la clase"
    redirect to('/classrooms')
  end

  post '/classrooms/:classroom/update' do
    @classroom = Classroom.find_by_id(params[:classroom])
    name = params[:name]
    @classroom.update(:name => name)
    "Actualizado"
  end

  post '/game/new' do
    @classroom = Classroom.find_by_id(params[:game][:classroom_id])
    @player1 = Student.find_by_id(params[:game][:student1])
    @player2 = Student.find_by_id(params[:game][:student2])
    @player3 = Student.find_by_id(params[:game][:student3])

    @topics = []
    params[:game][:topics].each do |t|
      @topics << Topic.find_by_id(t)
    end

    g = Game.new(:classroom_id => params[:game][:classroom_id])
    g.save

    Player.create(:student=>@player1, :game=>g)
    Player.create(:student=>@player2, :game=>g)
    Player.create(:student=>@player3, :game=>g)

    @topics.each do |t|
      Profile.create(:topic=>t, :game=>g)
    end

    redirect to("/game/#{g.id}")
  end

  get '/game/new' do
    @clases = current_user.classrooms
    @topics = current_user.topics

    @students = []

    @clases.each do |clase|
      clase.students.each do |student|
        @students << student
      end
    end

    erb :newGameOptions
  end

  post '/students/new' do
    @student = Student.new(params[:student])
    if @student.save
      session[:flash] = "Se ha agregado el alumno."
      redirect to("/classrooms/#{@student.classroom.id}/students")
    else
      "No se pudo guardar"
    end
  end

  post '/students/:student/update' do
    @student = Student.find_by_id(params[:student])
    name = params[:name]
    @student.update(:name => name)
    "Actualizado"
  end

  get '/students/:student/delete' do
    @student = Student.find_by_id(params[:student])
    @student.destroy
    session[:flash] = "Se ha elimiando el alumno"
    redirect to('/classrooms/:classroom/students')
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
    game = Game.find_by_id(params[:gameid])

    @players = game.players

    @categories = []

    game.topics.each do |topic|
      topic.categories.each do |category|
        @categories << category
      end
    end

    if @categories.count < 6
      return "Los temas no suman suficientes categorias"
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
