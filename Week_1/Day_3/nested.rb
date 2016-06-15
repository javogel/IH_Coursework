




hash = {:wut => [0, 1, {:wut => [0,[[0,1,2,3,4,5,6,7,8,{:bbq => "Hello there!"}]]]}]}

arr = [[0,1,2,3,4,{:secret => {:unlock => [0, "Whats up doc?"]}}]]



#Make sure these statements below work by creating a nested data structure using hashes
puts hash[:wut][2][:wut][1][0][9][:bbq]

puts arr[0][5][:secret][:unlock][1]
