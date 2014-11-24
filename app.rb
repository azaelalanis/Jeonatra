require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' #database configuration

Dir['models/*.rb'].each do |model|
  require_relative model
end

get '/' do
  "Hello, World!"
end
