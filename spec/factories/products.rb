FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    image { Faker::LoremFlickr.image }
    price { Faker::Commerce.price }
    currency { Faker::Currency.code }
    quantity { Faker::Number.between(from: 1, to: 10) }
  end
end