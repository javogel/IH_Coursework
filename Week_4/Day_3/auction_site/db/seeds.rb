# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.create(name: 'Luke', email: 'luke@gmail.com')
User.create(name: 'Johannus', email: 'Johannus@gmail.com')
User.create(name: 'Sebastian', email: 'Sebastian@gmail.com')
User.create(name: 'Florian', email: 'Florian@gmail.com')


Product.create(title: 'Iphone', description: 'blah blah blah', user_id: 1 , deadline: 14.days.from_now , minbid: 199.0)
Product.create(title: 'Speakers', description: 'blah blah blah', user_id: 1, deadline: Time.now, minbid: 200.0)
Product.create(title: 'Computer', description: 'blah blah blah', user_id: 1, deadline: 10.days.from_now , minbid: 2000.0)
Product.create(title: 'Yoga MAt', description: 'blah blah blah', user_id: 1, deadline: 2.days.ago, minbid: 1.0)


Bid.create(amount: 500, user_id: 1, product_id: 1)
Bid.create(amount: 300, user_id: 2, product_id: 1)
Bid.create(amount: 200, user_id: 2, product_id: 2)
Bid.create(amount: 450, user_id: 3, product_id: 2)
Bid.create(amount: 20, user_id: 2, product_id: 3)
Bid.create(amount: 40, user_id: 3, product_id: 3)
Bid.create(amount: 20, user_id: 2, product_id: 3)
Bid.create(amount: 44, user_id: 3, product_id: 3)
Bid.create(amount: 20, user_id: 2, product_id: 4)
Bid.create(amount: 40, user_id: 3, product_id: 4)
