puts "What is your name?"

name = gets.chomp


puts "What is your age?"

age = gets.chomp

age_girl = (age.to_i / 2) + 7.0



puts "Hello #{name}, you shouldn't date a girl younger than: #{age_girl}"
