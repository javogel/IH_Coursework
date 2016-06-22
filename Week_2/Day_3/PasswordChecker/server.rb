require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/PasswordChecker'



get '/' do
  erb :home
end



post '/login' do
  @user = params[:username]
  @password = params[:password]

   if PasswordChecker.new.check_password(@user, @password)
     redirect to("/congratulations")
   else
     redirect to("/")
   end
end


get '/congratulations' do
  "You have won at life! yay!"
end
