# spec/post_spec.rb
require_relative("../lib/Post.rb")

RSpec.describe Post do
 before(:each) do
 @post1 = Post.new("title1", "1", "Hello My name is post 1", "Category0", "author0")
 @post2 = Post.new("title2", "2", "Hello My name is post 2", "Category1", "author1")
 end

 it("#title returns title") do
   expect(@post1.title).to eq("title1")
   expect(@post2.title).to eq("title2")
 end

 it("#date returns date") do
   expect(@post1.date).to eq("1")
 end

 it("#text returns text") do
   expect(@post1.text).to eq("Hello My name is post 1")
 end

 it("#text returns text") do
   expect(@post1.author).to eq("author0")
 end

 it("#text returns text") do
   expect(@post1.category).to eq("Category0")
 end



end
