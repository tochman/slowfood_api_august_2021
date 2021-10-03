RSpec.describe 'POST /api/carts', type: :request do
  describe 'authorized logged in user can view cart and create order' do
    let(:product) { create(:product) }
    let(:user) { create(:user) }
    let(:auth_headers) { user.create_new_auth_token }

    before do
      post '/api/carts',
           params: {
             product_id: product.id
           },
           headers: auth_headers
    end

    it 'is expected to return a 201 response status' do
      expect(response).to have_http_status 201
    end

    it 'is expected to return a message' do
      # binding.pry
      expect((response_json)['message']).to eq(
        'This product was added to your cart!'
      )
    end

    it 'should return a cart id' do
      expect((response_json)['cart']['id']).to_not eq nil
    end

    it 'is expected to return an array of items' do
      expect(response_json['cart']['products'].count).to eq 1
    end
  end
end
