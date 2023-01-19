require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "GET #index" do
  context 'when making request without parameters' do
    before do
        create_list(:product, 10)
        get :index
      end

      it 'returns a 200 response' do
        expect(response).to have_http_status "200"
      end

      it 'returns all products' do
        expect(JSON.parse(response.body).size).to eq 10
      end
    end

    context 'when making request with parameters' do
      before do
        create(:product, name: 'Product 2', price: 10, currency: 'ARS')
        create(:product, name: 'Product 1', price: 10, currency: 'USD')
        create(:product, currency: 'CAD')
        create(:product, currency: 'EUR')
      end

      it 'retrieves the filtered list with the corresponding products when filtering by name' do
        get :index, params: { name: 'Product' }
        expect(JSON.parse(response.body).size).to eq 2
      end

      it 'retrieves the filtered list with the corresponding products when filtering by currency' do
      get :index, params: {currency: 'EUR'}
      expect(JSON.parse(response.body).size).to eq 1
      end
    end
  end

  describe "POST #create" do
    context 'when making request with valid parameters' do
      before do
        create_list(:product, 20)
      end

      it 'retrieves the list of products and an object with metadata information' do
        post :create, params: { page: 2, size: 10}
        expect(JSON.parse(response.body)['products'].size).to eq 10
        expect(JSON.parse(response.body)['metadata']['total_records']).to eq 20
        expect(JSON.parse(response.body)['metadata']['page']).to eq 2
      end
    end
  end
end
