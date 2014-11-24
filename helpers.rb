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
  end

  helpers UserHelper
end
