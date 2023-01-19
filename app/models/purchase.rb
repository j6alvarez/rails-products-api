# == Schema Information
#
# Table name: purchases
#
#  id           :integer          not null, primary key
#  currency     :string           default("USD"), not null
#  quantity     :integer          default(1), not null
#  total_amount :decimal(, )      not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  product_id   :integer
#  user_id      :integer
#
# Indexes
#
#  index_purchases_on_product_id  (product_id)
#  index_purchases_on_user_id     (user_id)
#
# Foreign Keys
#
#  product_id  (product_id => products.id)
#  user_id     (user_id => users.id)
#
class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :total_amount, presence: true, numericality: { greater_than: 0 }
  validates :currency, presence: true, format: { with: /\A[a-zA-Z]+\z/ }
end
