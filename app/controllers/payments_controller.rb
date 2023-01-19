class PaymentsController < ApplicationController

  def create
    begin
    quantity = params[:quantity]
    total_amount = product.price * quantity
    currency = product.currency
    purchase = Purchase.new(product: product, user: user, quantity: quantity, total_amount: total_amount, currency: currency)

    if purchase.save
      render json: purchase, status: :created
    else
      render json: { errors: purchase.errors }, status: :unprocessable_entity
    end
    rescue => e
      render json: { errors: e.message }.to_json, status: :unprocessable_entity
    end
  end

  private

  def product
    @product ||= Product.find(params[:product_id])
  end

  # User id by params since there is no authentication
  def user
    @user ||= User.find(params[:user_id])
  end

end
