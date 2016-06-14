require 'colorize'
require 'pry'
require_relative "Blog"
require_relative "Post"
require_relative "SponsoredPost"







blog = Blog.new
blog.add_post Post.new("Title 1", 1, "Lorem Ipsum Dolor Sic Amet" )
blog.add_post Post.new("Title 2", 2, "Lorem Ipsum Dolor Sic Amet" )
blog.add_post Post.new("Title 3", 3, "Lorem Ipsum Dolor Sic Amet" )
blog.add_post SponsoredPost.new("Title 4", 4, "Lorem Ipsum Dolor Sic Amet")
blog.add_post Post.new("Title 5", 5, "Lorem Ipsum Dolor Sic Amet" )
blog.add_post Post.new("Title 6", 6, "Lorem Ipsum Dolor Sic Amet" )
blog.add_post SponsoredPost.new("Title 7", 7, "Lorem Ipsum Dolor Sic Amet")
blog.add_post Post.new("Title 8", 8, "Lorem Ipsum Dolor Sic Amet" )
blog.add_post Post.new("Title 9", 9, "Lorem Ipsum Dolor Sic Amet" )

blog.publish_front_page
