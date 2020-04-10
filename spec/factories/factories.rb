# frozen_string_literal: true

FactoryBot.define do
  factory :category, class: 'Category' do
    sequence(:name) { |n| "category#{n}" }
    tax_slab { 0.10 }
  end

  factory :item, class: 'Item' do
    sequence(:name) { |n| "item#{n}" }
    cost { 5.00 }
    inventory { 100 }
    brand { 'brand' }
    category_id { 1 }
  end

  factory :user, class: 'User' do
    name { 'user' }
    sequence(:email) { |n| "email#{n}" }
    password { 'password' }
    password_confirmation { 'password' }
    phone_num { '5555555555' }
    dob { '01/01/1990' }
    address_l1 { 'address L1' }
    city { 'city' }
    state { 'state' }
    zip { '17390' }
    card_name { 'card name' }
    card_num { '0000000000000000' }
    card_expire { '01/21' }
    card_ccv { 111 }
    admin { false }
  end
end
