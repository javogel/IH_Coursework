class Blog
  attr_accessor :posts

  def initialize
    @posts = []
  end

  def add_post(post_name)
    @posts << post_name
  end

  def latest_posts
    return @posts.sort! {|x,y| y.date.to_i <=> x.date.to_i }
  end

  def publish_front_page
    #sorting the posts
    @posts.sort! {|x,y| x.date <=> y.date}

    #calculating the number of pages
    number_of_posts = @posts.length

    #the below method slices the array into smaller arrays of 3 posts each
    split_posts=@posts.each_slice(3).to_a

    #calculate number of pages by figuring how many arrays the posts were split into
    number_of_pages = split_posts.length

    # pages = number_of_posts/3
    current_page = 0

    #setting while lopp quitter to false
    quitloop = false

    #entering a while loop for moving in between pages, prompting user for instructions. Exiting until user requests it.
    while quitloop==false
        split_posts[current_page].each do |individual_post|
          individual_post.printme
        end

        number_of_pages.times do |i|
          if current_page == i
            print " " + (i+1).to_s.colorize(:red)
          else
            print " " + (i+1).to_s
          end
        end


        #prompts user for instructions
        puts "\nDo you want to 'next', 'prev', or 'exit':\n"
        user_input = gets.chomp
          if user_input == "next"
            current_page += 1
            if current_page > (number_of_pages-1)
              puts "This is the last page. You cannot select next.\n".colorize(:yellow)
              current_page -= 1
            end
          elsif user_input == "prev"
            current_page -= 1
            if current_page < 0
              puts "This is the first page. You cannot go back.\n".colorize(:yellow)
              current_page += 1
            end
          elsif user_input == "exit"
            quitloop = true
          else
            puts "Please enter one of the permitted values\n".colorize(:yellow)
          end

    end

  end

end
