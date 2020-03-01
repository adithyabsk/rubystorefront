# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

[
    ["Admin", "csc517store@gmail.com", "admin", true, "01/01/1998"],
    ["Carl Klier", "caklier@ncsu.edu", "carl", false, "01/01/1998"],
    ["Adithya Balaji", "abalaji2@ncsu.edu", "adithya", false, "01/01/1998"],
    ["Colin Foley", "cmfoley2@ncsu.edu", "colin", false, "01/01/1998"],
    ["Young User", "young@gmail.com", "young", false, "01/01/2008"],
    ["Old User", "old@gmail.com", "old", false, "01/01/1940"]
].each do |name, email, password, is_admin, dob|
  User.create!(name:name, email:email, password: password, password_confirmation: password, is_admin: is_admin,
              phone_num: "5555555555", dob: dob, address_l1: "line 1", address_l2: "line 2", city: "gso",
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
[["Apple", "Fuji", "https://cdn11.bigcommerce.com/s-la1x8o7zmn/images/stencil/800x800/products/622/489/RedApple__23344.1570489422.jpg"], 
["Orange", "Paramount Citrus", "https://soappotions.com/wp-content/uploads/2017/10/orange.jpg"], 
["Bannana", "Del Monte", "https://cdn.mos.cms.futurecdn.net/42E9as7NaTaAi4A6JcuFwG-320-80.jpg"]].each do |name, brand, image_url|
  Item.create!(name: name, cost: rand(0.5..10.0), image_url:image_url, brand: brand, inventory: 100, category_id: Category.find_by(name: "Food").id)
end

#Add item with 0 inventory
[["Coffee", "Starbucks", "https://globalassets.starbucks.com/assets/1b68ff25144844af8cee77c0de7f2c63.jpg"]].each do |name, brand, image_url|
  Item.create!(name: name, cost: rand(0.5..10.0), image_url:image_url, brand: brand, inventory: 0, category_id: Category.find_by(name: "Food").id)
end
# Commodities
[["Chair", "Herman Miller", "https://images-na.ssl-images-amazon.com/images/I/71Qa44-4WPL._AC_SX522_.jpg"],
 ["Umbrella", "Swiss Gear", "https://i.pinimg.com/originals/27/44/ea/2744ead4eebca68b62abfa7c14361d5e.jpg"],
 ["Backpack", "Jansport", "https://images-na.ssl-images-amazon.com/images/I/61dCHkBQInL._AC_SL1000_.jpg"]].each do |name, brand, image_url|
  Item.create!(name: name, cost: rand(0.5..10.0), brand: brand, image_url:image_url, inventory: 100,
                  category_id: Category.find_by(name: "Commodity").id, age_restricted: true
  )
end
# Luxuries
[["Watch", "Rolex", "https://www.swissluxury.com/product_images/116710BLNR.jpg"],
 ["Sports Car", "Mercedes", "https://www.mbusa.com/content/dam/mb-nafta/us/myco/my20/e/sedan/all-vehicles/2020-E350-SEDAN-AVP-DR.png"],
 ["Cologne", "Armani", "https://images-na.ssl-images-amazon.com/images/I/51CbWZt0jLL._SL1000_.jpg"]].each do |name, brand, image_url|
  Item.create!(name: name, cost: rand(0.5..10.0), brand: brand, image_url:image_url, inventory: 100,
                  category_id: Category.find_by(name: "Luxury").id, restricted: true
  )
end

# Feedback
["Carl Klier", "Adithya Balaji"].each do |name|
  user = User.find_by(name: name)
  Feedback.create!(name: user.name, email: user.email, message: Faker::Lorem.paragraph(sentence_count: 30))
end

# Wishlist
["Carl Klier", "Adithya Balaji"].each do |name|
  user = User.find_by(name: name)
  ["Watch", "Apple", "Chair"].each do |name|
    item = Item.find_by(name: name)
    user.wishlist.items<<item
  end
end
