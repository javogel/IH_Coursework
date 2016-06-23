class SponsoredPost < Post
  attr_reader :title, :date, :text

  def initialize(title, date, text)
    super(title, date, text)
  end

  def printme
       puts "******#{@title}******
     **************"
     puts @text
     puts "----------------"
  end

end
