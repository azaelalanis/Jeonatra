class Jeonatra

  get '/password' do
    erb :password
  end

  post '/password' do
    p = params[:user]
    p[:first_login] = false

    @user = current_user

    if @user.update(p)
      session[:flash] = "Su password ha sido actualizado"
      redirect to('/')
    else
      redirect to('/')
    end
  end

  get '/register' do
    erb :register
  end

  post '/register' do
    name = params[:user][:name]
    email = params[:user][:email]

    @professor = Professor.new

    @professor.name = name
    @professor.email = email
    @professor.password =  [*('A'..'Z')].sample(6).join #Generate Random Password
    @professor.login_attempts = 0
    @professor.first_login = true
    @professor.blocked_time = Time.now

    if @professor.save
      send_welcome_message(@professor)
      session[:flash] = "Pronto recibira un correo con su password"
      redirect to("/")
    else
      "No se pudo registrar su cuenta"
    end

  end

  private

  def send_welcome_message(user)
    Mail.deliver do
      to user.email
      from 'desarrolloweb@itesm.mx'
      subject 'Su password para Jeopardy'
      body "Hola #{user.name}\r\nSu nuevo password es: #{user.password}"
    end
  end

end
