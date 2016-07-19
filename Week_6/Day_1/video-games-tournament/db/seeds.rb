# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

t1 = Tournament.create(name: "Golf")
t2 = Tournament.create(name: "Frisbee")
t3 = Tournament.create(name: "Tennis")
t4 = Tournament.create(name: "Maynard")

p1 = Player.create(name: "Johannus")
p2 = Player.create(name: "Alina")
p3 = Player.create(name: "David")
p4 = Player.create(name: "Valentine")

# 
# r1 = Registration.create(play)
