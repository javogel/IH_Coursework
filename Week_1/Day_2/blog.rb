require 'colorize'
require 'pry'

class Blog
  # attr_accessor :posts

  def initialize
    @posts = []
  end

  def add_post(post_name)
    @posts << post_name
  end

  def publish_front_page
    #sorting the posts
    @posts.sort! {|x,y| x.date <=> y.date}

    #calculating the number of pages
    number_of_posts = @posts.length
    split_posts=@posts.each_slice(3).to_a
    number_of_pages = split_posts.length
    # pages = number_of_posts/3
    current_page = 0
    quitloop = false

    while quitloop==false
        split_posts[current_page].each do |individual_post|
          if individual_post.sponsored
            puts "******#{individual_post.title}******
          **************"
          else
            puts individual_post.title
            puts "**************"
          end

          puts individual_post.text
          puts "----------------"
        end

        number_of_pages.times do |i|
          if current_page == i
            print " " + (i+1).to_s.colorize(:red)
          else
            print " " + (i+1).to_s
          end
        end


        #prompts user for instructions
        puts "\nDo you want to 'next', 'prev', or 'exit'\n"
        user_input = gets.chomp
          if user_input == "next"
            current_page += 1
          elsif user_input == "prev"
            current_page -= 1
          elsif user_input == "exit"
            quitloop = true
          else
            puts "Please enter one of the permitted values"
          end

    end

  end




end



class Post

  attr_accessor :title, :date, :text, :sponsored

  def initialize(title, date, text, sponsored=false)
    @title = title
    @date = date
    @text = text
    @sponsored = sponsored

  end
end




blog = Blog.new
blog.add_post Post.new("Title 1", 1, "Lorem Ipsum Dolor Sic Amet" )
blog.add_post Post.new("Title 2", 2, "Lorem Ipsum Dolor Sic Amet" )
blog.add_post Post.new("Title 3", 5, "Lorem Ipsum Dolor Sic Amet" )
blog.add_post Post.new("Title 4", 4, "Lorem Ipsum Dolor Sic Amet", true )
blog.add_post Post.new("Title 5", 3, "Lorem Ipsum Dolor Sic Amet" )
blog.add_post Post.new("Title 6", 6, "Lorem Ipsum Dolor Sic Amet" )
blog.add_post Post.new("Title 7", 7, "Lorem Ipsum Dolor Sic Amet", true )
blog.add_post Post.new("Title 8", 8, "Lorem Ipsum Dolor Sic Amet" )
blog.add_post Post.new("Title 9", 9, "Lorem Ipsum Dolor Sic Amet" )

blog.publish_front_page
