class Jeonatra
  set :root, File.join(File.dirname(__FILE__), "..")
  set :views, settings.root + '/vistas'
  enable :sessions
  helpers Sinatra::UserHelper
end
