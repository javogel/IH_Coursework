

class SpeedControl

  def initialize

  end

  def current_speed
     puts "Please type your speed(in numbers only):"
     speed = gets.chomp
    if speed>100
      puts "Speed is above 100!"
    elsif speed < 100
      puts "Speed is below 100"
    end

  end

end
