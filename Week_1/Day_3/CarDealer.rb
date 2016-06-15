class CarDealer

  def initialize(inventory)
    @inventory = inventory
    #inventory should be a hash of arrays.
  end

  def cars(car_name)


    print "#{car_name}: #{@inventory[car_name][0]}"
    @inventory[car_name][1..-1].each{|car| print ", #{car.to_s}" }
    puts "\n"


  end

end


joes_dealership = CarDealer.new({
  :Ford => ["Fiesta", "Mustang"],
  :Honda => ["Civic", "CR-V"],
  :Toyota => ["Corolla", "HiLux", "LandCruiser"]

  })



puts "What car do you want to search: "
car_query = gets.chomp
joes_dealership.cars(car_query.to_sym)
