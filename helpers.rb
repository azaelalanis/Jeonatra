module Sinatra
  module UserHelper
    def logged_in?
      session[:logged_in]
    end

    def current_user
      email = session[:user_id]
      user = Professor.find_by_email(email)
      return user
    end

    def flash_messages
      if session[:flash]
        mensaje = session[:flash]
        session[:flash] = nil
        return "<div class='alert alert-info' role='alert'> #{mensaje} </div>"
      end
    end
  end

  helpers UserHelper
end
