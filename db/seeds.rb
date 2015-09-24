# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..50).each do |x|
  Book.create!(isbn: x, title: "Book #{x}", description: "test description", author: "Some Author")
end

Admin.create!(first_name: "Pranjal", last_name: "Deka", password: "12345678", password_confirmation: "12345678", email: "pdeka@ncsu.edu")
