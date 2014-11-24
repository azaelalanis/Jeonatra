module Sinatra
  module UserHelper
    def logged_in?
      session[:logged_in]
    end
  end

  helpers UserHelper
end
