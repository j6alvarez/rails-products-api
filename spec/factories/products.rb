# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  currency   :string           default("USD"), not null
#  image      :text             default(""), not null
#  name       :string           default(""), not null
#  price      :decimal(, )      default(0.0), not null
#  quantity   :integer          default(1), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_products_on_id  (id) UNIQUE
#
FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    image { Faker::LoremFlickr.image }
    price { Faker::Commerce.price }
    currency { Faker::Currency.code }
    quantity { Faker::Number.between(from: 1, to: 10) }
  end
end
