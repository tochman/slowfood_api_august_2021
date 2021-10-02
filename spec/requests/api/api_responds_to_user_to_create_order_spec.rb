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
      binding.pry
      expect(response).to have_http_status 201
    end
    it 'is expected to return an item name' do
      expect(['Carts'].first['user_id']).to_not be nil
    end
  end
end
