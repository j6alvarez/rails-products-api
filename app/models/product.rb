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
class Product < ApplicationRecord
  has_many :purchases
  has_many :users, through: :purchases

  validates :name, :image, :price, :currency, :quantity, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validates :currency, format: { with: /\A[a-zA-Z]+\z/ }
end
