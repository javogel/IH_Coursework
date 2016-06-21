# server.rb
require "sinatra"

get "/add" do
  erb(:add)
end
