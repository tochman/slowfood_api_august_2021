RSpec.describe('GET api/carts') do
  describe 'successfully' do
    let(:user) { create(:user) }
    let(:cart) { create(:cart) }
    let(:product) { create(:product, name:"Kangaroo Steak") }
    let(:auth_headers) { user.create_new_auth_token }

    before do
      cart.cart_products.create(product)
      get '/api/carts/#{cart.id}',
        params: { order_product_id: cart.id},
          headers: auth_headers
    end

    it 'is expected to return a 200 response status' do
      # binding.pry
      expect(response).to have_http_status 200
    end

    it 'is expected to return an item name' do
      expect(response_json['cart']['id']).to eq cart.id
    end
  end
end
