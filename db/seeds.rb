# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Restaurant.destroy_all
Review.destroy_all

5.times do
  name = Faker::Restaurant.name
  address = Faker::Address.full_address
  phone_number = Faker::PhoneNumber.cell_phone_with_country_code
  category = ["chinese", "italian", "japanese", "french", "belgian"].sample
  new_restaurant = Restaurant.create(name: name, address: address, phone_number: phone_number, category: category)
  6.times do
    content = Faker::Restaurant.review
    rating = rand(0..5)
    new_review = Review.create(content: content, rating: rating, restaurant: new_restaurant)
  end
end

