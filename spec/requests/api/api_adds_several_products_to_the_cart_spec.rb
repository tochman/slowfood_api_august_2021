RSpec.describe 'PUT /api/carts', type: :request do
  subject { response }
  let(:product_1) { create(:product, name: 'Kangaroo Steak') }
  let(:product_2) { create(:product, name: 'Whale Blubber Stew') }
  let(:user) { create(:user) }
  let(:cart) { create(:cart, user_id: user.id) }
  let(:auth_headers) { user.create_new_auth_token }
  describe 'authorized user can add products to an existing cart' do
    before do
      cart.cart_products.create(product_id: product_1.id)
      put "/api/carts/#{cart.id}",
          params: {
            products: product_2.id
          },
          headers: auth_headers
    end

    it { is_expected.to have_http_status 200 }

    it 'is expected to return an array of items' do
      expect(response_json['cart']['products'].count).to eq 2
    end

    it('is expected that the second product is added to the cart') do
      expect(response_json['message']).to eq(
        'Whale Blubber Stew was added to your cart!'
      )
    end
  end
end
