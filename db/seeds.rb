# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 3.times do
# a =  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Name.first_name, email: Faker::Internet.free_email, password: 'password1234567', bio: Faker::StarWars.quote)
# end

6.times do 
a = Post.create(body: Faker::StarWars.quote, user_id: rand(1..13))
end