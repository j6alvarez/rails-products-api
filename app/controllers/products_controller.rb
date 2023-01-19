class ProductsController < ApplicationController

  def index
    begin
    render json: products, status: :ok
    rescue => e
      render json: { error: e.message }, status: :bad_request
    end
  end

  def show
    begin
      render json: product, status: :ok
    rescue => e
      render json: { error: e.message }, status: :not_found
    end
  end

  def create
    begin
      metadata = {
      page: page.to_i,
      total_records: products.total_count
    }

    render json: { metadata: metadata, products: products }, status: :ok
    rescue => e
      render json: { error: e.message }, status: :bad_request
    end
  end

  private

  def products
    size = params[:size] || 10
    name = params[:name]
    currency = params[:currency]

    @products = Product.all
    @products = @products.where("name like ?", "%#{name}%") if name.present?
    @products = @products.where(currency: currency) if currency.present?
    @products = @products.page(page).per(size)
  end

  def product
    @product ||= Product.find(params[:id])
  end

  def page
    @page ||= params[:page] || 1
  end
end
