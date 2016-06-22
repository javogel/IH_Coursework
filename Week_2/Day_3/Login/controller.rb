require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/login'

login_object = Login.new

get '/' do

  erb :login

end

post '/validate' do
  session[:user] = params[:username]
  session[:pw] = params[:password]
  session[:loggedin] = login_object.validate(session[:user], session[:pw])


  if login_object.validate(session[:user], session[:pw])
    redirect to("/profile")
  else
    redirect to("/error")
  end

end

get '/profile' do

  if session[:loggedin]
  "Welcome to Johannus' Profile"
  else
  redirect to("/error")
  end

end



get '/error' do
  "You did not put in the right password"
end



get '/signup' do
  erb :sign_up

end

post '/register' do
  @user = params[:username]
  @pw = params[:password]
  login_object.sign_up(@user, @pw)
  redirect to("/")

end
