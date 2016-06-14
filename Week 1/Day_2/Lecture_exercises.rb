class Car

  def initialize(name = "Random Joe")
    @instancetype = (rand(2)).to_i
    @countries_visited = []
    @@name = name

  end

  def Honk
    if @instancetype == 1
    puts "Broom"
    elsif @instancetype == 0
      puts "BROOOOOOM"
    end
  end



  def sayMyName
    puts @@name
  end



  def self.speed_control
     puts "Please type your speed(in numbers only):"
     speed = gets.chomp
    if speed.to_i > 100
      puts "Speed is above 100!"
    elsif speed.to_i < 100
      puts "Speed is below 100"
    end
  end


  def visited(country)
      @countries_visited << country
  end

  def namecities
    puts @countries_visited
  end


end



first = Car.new
second = Car.new
third = Car.new
fourth = Car.new("Johannus")
fifth = Car.new


puts "\nFirst Car goes:\n"
first.Honk


puts "\n\nSecond Car goes:\n"
second.Honk

puts "\n\nThird Car goes:\n"
third.Honk


puts "\n\nFourth Car is named:\n"
fourth.sayMyName

puts "\n\nFifth Car is named:\n"
fifth.sayMyName


Car.speed_control

puts "\n\n\n"

first.visited("España")
first.visited("Nicaragua")
first.visited("Thailand")
first.visited("China")

first.namecities
