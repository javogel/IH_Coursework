class Post

  attr_reader :title, :date, :text, :category, :author

  def initialize(title, date, text, category, author)
    @title = title
    @date = date
    @text = text
    @category = category
    @author = author
  end

  def printme
    puts @title
    puts "**************"
    puts @text
    puts "----------------"
  end

end
