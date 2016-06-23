# server.rb
require "sinatra"
require_relative "lib/Blog.rb"
require_relative "lib/Post.rb"

blog = Blog.new
blog.add_post Post.new("title1", "Wednesday", "Hello My name is post 1", "Category1", "John")
blog.add_post Post.new("title2", "Tuesday", "Hello My name is post 2", "Category2", "John")
blog.add_post Post.new("title3", "Monday", "Hello My name is post 3", "Category3", "John")



 get "/" do
   @posts = blog.latest_posts
   erb(:home)
 end


  get "/post_details/:index" do
    @post = blog.posts[params[:index].to_i]
    erb(:post_details)
  end


  get "/new_post" do
    erb(:new_post)
  end


  post "/create_post" do
    @title = params[:title]
    @text = params[:text]
    @author = params[:author]
    @category = params[:category]
    @date = Time.now
    blog.add_post Post.new(@title, @date, @text, @category, @author)
    redirect to("/")

  end
