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
end
