class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49)
]


puts homes[0].name
puts homes[1].name
puts homes[2].name
puts homes[3].name
puts homes[4].name

puts "\n"



#prints name, city and price of each home
homes.each {|home| puts "#{home.name} in #{home.city}\n Price: #{home.price} a night and a capacity of #{home.capacity}"}
#
# #creating an array of prices
# home_prices = homes.map {|home| home.price}
#
# #creating the sum and then the average via reduction
# sum = home_prices.reduce(0.0) {|sum,x| sum + x }
# puts "\n The sum of all prices is: #{home_prices}"
# puts "\n The average price of all homes is: #{sum/home_prices.length}"



# Asking the user how he wants to sort

puts "\n Properties sorted by price(lowest first) type 'price' to continue. If you would you like to sort by price(highest first) type 'priceh' or by capacity type 'capacity'?"
sort_order = gets.chomp

sorted=false

while sorted == false
  if sort_order=="price"
      #sorting homes
      sorted_homes = homes.sort{|x,y| x.price <=> y.price }

      sorted = true
  elsif sort_order=="priceh"
      sorted_homes = homes.sort{|x,y| y.price <=> x.price }

      sorted = true
  elsif sort_order == "capacity"
      sorted_homes = homes.sort{|x,y| x.capacity <=> y.capacity }

      sorted = true
  else
    puts "\nPlease enter your sort preference in the following manner: (price or capacity)?"
    sort_order = gets.chomp
  end
end


#prints name, city and proce of each home, now sorted
sorted_homes.each {|home| puts "#{home.name} in #{home.city}\n Price: #{home.price} a night and capacity #{home.capacity}"}





#Asking the user what he wants to filter and then filtering
puts "\nWhat city do you want to filter by?"
filter_name = gets.chomp
filtered_homes = homes.select {|home| home.city == filter_name}
puts "\nWe found the following homes for you:"
filtered_homes.each {|home| puts "\n #{home.name} in #{home.city}\n Price: #{home.price} a night and capacity #{home.capacity}"}

filtered_sum = filtered_homes.reduce(0.0) {|sum,x| sum + x.price}
puts "\n This is the average price for the homes you are looking at is: $#{filtered_sum/filtered_homes.length}"





#Asking the user what price he wants to look for
puts "\nIs there a price that you would like to search for?"
user_price = gets.chomp
pfiltered_homes = homes.find {|home| home.price == user_price.to_i}
puts "\nWe found the following homes for you:"

if pfiltered_homes==nil
  puts "No homes found!"
else
   puts "\n #{pfiltered_homes.name} in #{pfiltered_homes.city}\n Price: #{pfiltered_homes.price} a night and capacity #{pfiltered_homes.capacity}"
end
