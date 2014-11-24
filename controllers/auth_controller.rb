class Jeonatra

  post '/login' do

    user = params[:user][:email]
    pass = params[:user][:password]

    if login_user(user,pass)
      session[:logged_in] = true
      session[:user_id] = user
      redirect back
    else
      return "No se pudo hacer login: #{session[:login_msg]}"
    end

  end

  get '/logout' do
    session[:logged_in] = nil
    redirect back
  end


  private

  def login_status(email, password)
    # 0 Usuario inexistente
    # 1 Cuenta Desbloqueada, User Corecto y Password Correctos
    # 2 Cuenta Desbloqueda. User Correcto y Password Incorrecto
    # 3 Cuenta Bloqueda. User y Password Correctos. No han pasado 10 minutos
    # 4 Cuenta Bloqueda. User y Password Correctos. Han pasado 10 minutos
    # 5 Cuenta Bloqueda. User y Password Incorrecto.

    user = Professor.find_by_email(email)
    return 0 if user.nil?
    if user.login_attempts < 3
      if user.password == password; return 1; else; return 2; end
    else
      if user.password == password
        if ((Time.now - user.blocked_time)/60).round < 10
          return 3
        else
          return 4
        end
      else
        return 5
      end
    end
  end

  def login_user(email,password)
    status_code = login_status(email,password)


    user = Professor.find_by_email(email)
    case status_code
    when 0
      # User Incorrecto
      session[:login_msg] = "Usuario inexistente"
      return false
    when 1
      # Cuenta Desbloqueda / User Incorrecto / Password Correcto
      return true
    when 2
      # Cuenta Desbloqueda / User Correcto  /  Password Incorrecto
      user.login_attempts = user.login_attempts + 1
      if user.login_attempts == 3
        user.blocked_time = Time.now
      end
      user.save

      session[:login_msg] = "Contraseña Incorrecta"
      return false
    when 3
      # Contraseña correcta. Pero su cuenta esta bloqueda por 10 minutos

      session[:login_msg] = "Su cuenta se encuentra temporalmente bloqueda"
      return false
    when 4
      # Contraseña correcta. Ya pasaron los 10 minutos
      user.login_attempts = 0
      user.save
      return true
    when 5
      # Contra inocrrecta.
      user.blocked_time = Time.now
      user.save
      session[:login_msg] = "Su cuenta ha sido bloqueda por 10 minutos"
      return false
    end
  end

end
