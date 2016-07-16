require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :geolocation
end
