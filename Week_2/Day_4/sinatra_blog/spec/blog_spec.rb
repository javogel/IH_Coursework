# spec/blog_spec.rb
require_relative("../lib/Blog.rb")
require_relative("../lib/Post.rb")


RSpec.describe Blog do

 before(:each) do
   @blog = Blog.new
   @post1 = Post.new("title1", "1", "content1", "Category0". "author0")
   @post2 = Post.new("title1", "2", "content1", "Category1". "author1")
 end

 it("#posts returns list of empty posts") do
   expect(@blog.posts).to be_empty
 end

 it("#posts returns list of posts") do
   @blog.add_post @post1
   @blog.add_post @post2

   expect(@blog.posts.length).to eq(2)
   expect(@blog.posts).to include(@post1)
   expect(@blog.posts).to include(@post2)
 end

 it("#posts returns list of posts") do
   @blog.add_post @post1
   @blog.add_post @post2
   @latest = @blog.latest_posts

   expect(@latest.first).to eq(@post2)

 end

end
