# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

require 'faker'
require 'factory_bot'

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
  end

  factory :product do
    name { Faker::Commerce.product_name }
    image { Faker::LoremFlickr.image }
    price { Faker::Commerce.price }
    currency { Faker::Currency.code }
    quantity { Faker::Number.between(from: 1, to: 10) }
  end
end

3.times do
  FactoryBot.create(:user)
end

5.times do
  FactoryBot.create(:product)
end

