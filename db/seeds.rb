# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

[
    ["Carl Klier", "carl@gmail.com", "123456", true],
    ["Adithya Balaji", "adithya@gmail.com", "adithya", true],
    ["Standard User", "standard@user.com", "standard", false]
].each do |name, email, password, is_admin|
  User.create!(name:name, email:email, password: password, password_confirmation: password, is_admin: is_admin,
              phone_num: "5555555555", dob: "01/01/1998", address_l1: "line 1", address_l2: "line 2", city: "gso",
              state: "NC", zip:"27560", card_name: name, card_num: "1234567890123456", card_expire: "01/22",
              card_ccv: 555
              )
end

# Categories
[["Food", 0.02], ["Commodity", 0.04], ["Luxury", 0.08]].each do |name, tax_slab|
  Category.create!(name: name, tax_slab: tax_slab)
end

# Items
# Food
[["Apple", "Fuji"], ["Orange", "Paramount Citrus"], ["Bannana", "Del Monte"]].each do |name, brand|
  Item.create!(name: name, cost: rand(0.5..10.0), brand: brand, quantity: 100, category_id: Category.find_by(name: "Food").id)
end
# Commodities
[["Chair", "Herman Miller"], ["Umbrella", "Swiss Gear"], ["Backpack", "Jansport"]].each do |name, brand|
  Item.create!(name: name, cost: rand(0.5..10.0), brand: brand, quantity: 100,
                  category_id: Category.find_by(name: "Commodity").id, age_restricted: true
  )
end
# Luxuries
[["Watch", "Rolex"], ["Sports Car", "Mercedes"], ["Cologne", "Armani"]].each do |name, brand|
  Item.create!(name: name, cost: rand(0.5..10.0), brand: brand, quantity: 100,
                  category_id: Category.find_by(name: "Luxury").id, restricted: true
  )
end

# Feedback
["Carl Klier", "Adithya Balaji", "Standard User"].each do |name|
  user = User.find_by(name: name)
  Feedback.create!(name: user.name, email: user.email, message: Faker::Lorem.paragraph(sentence_count: 30))
end
