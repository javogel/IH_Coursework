require 'rspec'
require 'sinatra'
require 'imdb'
require_relative './lib/Movies'

movies = Movies.new
get "/" do
  redirect to("/movie_main")
end

get "/movie_main" do
  erb(:movie_main)
end


post "/search_movie" do
  @query = params[:query]
  @movies = movies.search(@query)

  erb(:search_movie)
end


array[0..20]
newarray array with selected
so that you dont load the whole database
