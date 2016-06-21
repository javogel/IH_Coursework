require 'sinatra'

get "/" do
# "Testing my first Sinatra App. Go to:"
"<a href='http://localhost:4567/hi'>My second sinatra page</a>"
end

get "/hi" do
erb(:about)
end
