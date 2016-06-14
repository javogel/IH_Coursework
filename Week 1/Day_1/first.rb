# name = "Johannus"
# puts "Hello " + name + "!!!!"
# puts "Hello #{name}"
# age = 30.5
#
# puts "my age is #{age}"
#
# puts "age class is #{age.class} "
#
# age = age.to_i
#
#
# puts "my age is #{age}"
#
# puts "age class is #{age.class} "

# puts "Whats your name?"
# name = gets.chomp "Hello, please tell me your name:\n"
#
# puts "Hello #{name}. How are you Today."


# IO.write("firstWrittenFile.txt", "This is the first file \n2760892")
# fileContent = IO.read("firstWrittenFile.txt")
# puts fileContent


# classmates = [
#   "Miguel",
#   "Tatiana",
#   "David"
# ]
#
# # classmates.each do |mates|
# #   puts "Goodmorning, #{mates}"
# # end
# classmates.map{|names| puts "Goodmornings, #{names}"}
#

#
# input = [3,5,6,7]
#
# output = input.map do |item|
# item += 1
# end
#
# puts input
# puts output

cities = ["miami", "madrid", "barcelona"]
# puts cities.map{|names| names.capitalize}




# numbers = [2,4,5,6,7]
#
#
# totals = numbers.reduce(0){|sum,x| sum + x}
#
# puts totals

# puts  [1].reduce {|sum,x| sum + x}

totals = cities.reduce(0){|sum,x| sum + x.length}
puts totals/cities.length
