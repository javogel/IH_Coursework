class Soy


 def instance_method
  puts "I am the instance method"
 end


 def self.class_method
 puts "I am the class method"
 end


end

Soy.class_method

test_object = Soy.new
test_object.instance_method
