class Tool

  def initialize
  end

  def login
    puts "What is your username and password?"
    print "username: "
    @username = gets.chomp
    print "password: "
    @password = gets.chomp

    if (@username == "javogel") && (@password == "123")
      puts "You have successfully logged in!"
      puts "Enter words to count:"
      words = gets.chomp
      count_words(words)
    else
      puts "Wrong credentials. Please try again."
    end
  end

  def count_words(words)

    word_count = words.split(" ")
    number_of_words = word_count.length
    puts "You have entered the following number of words #{number_of_words}"

  end
end


sesion = Tool.new
sesion.login
