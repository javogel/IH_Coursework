require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/login'



get '/' do

  erb :login

end

post '/validate' do
  session[:user] = params[:username]
  session[:pw] = params[:password]

  if Login.validate(session[:user], session[:pw])
    redirect to("/profile")
  else
    redirect to("/error")
  end
end

get '/profile' do
  "Welcome to Johannus' Profile"
end



get '/error' do
  "You did not put in the right password"
end
