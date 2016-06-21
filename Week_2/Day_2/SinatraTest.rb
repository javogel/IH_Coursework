require 'sinatra'
require 'sinatra/reloader'

get "/" do
# "Testing my first Sinatra App. Go to:"

"<a href='http://localhost:4567/hi'>My second sinatra page</a>"

"<a href='http://localhost:4567/hours/ago/5'>Time two hours ago</a>"
end

get "/hi" do
  @colors = ["black", "blue", "green", "red", "purple"]
  erb(:about)
end



get "/hours/ago/:time" do

  @time = DateTime.now - (params[:time].to_i/24.0)

  erb(:hours)
end
