# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Carl Klier", email: "carl@gmail.com", password: "123456", password_confirmation: "123456", isAdmin: true, phone_num: "5555555555", dob: "01/01/1998", address_l1: "line 1", address_l2: "line 2", city: "gso", state: "NC", zip:"27560", card_name:"Carl Klier", card_num: "1234567890123456", card_expire: "02/20", card_ccv: 555)
