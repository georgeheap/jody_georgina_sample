# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Avatar.destroy_all
Profile.destroy_all

if Customer.find_by(username: "Fred", email: "fred@awesome.com").nil?
  Customer.create(username: "Fred", email: "fred@awesome.com", password: "123456")
end
if Customer.find_by(username: "Barvis", email: "barvis@awesome.com").nil?
  Customer.create(username: "Barvis", email: "barvis@awesome.com", password: "123456")
end
if Customer.find_by(username: "SuzyCreamcheese", email: "susan@awesome.com").nil?
  Customer.create(username: "SuzyCreamcheese", email: "susan@awesome.com", password: "123456")
end
