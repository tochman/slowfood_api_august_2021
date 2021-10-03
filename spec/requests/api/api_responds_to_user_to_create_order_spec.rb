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

    it 'is expected to return a 204 response status' do
      expect(response).to have_http_status 204
    end
    it 'is expected to return an item name' do
      binding.pry
      expect(response_json['Carts']['product'].name).to eq 'MyString'
    end
  end
  
  describe 'The sad path where user is not authorized' do
    let(:product) { create(:product) }
    let(:user) { create(:user) }
    let(:auth_headers) { user.create_new_auth_token }

    before do
      post '/api/carts',
           params: {
             product_id: product.id
           },
           headers: {}
    end
    it ' is expected to return a 401 response status' do
      expect(response).to have_http_status 401
    end
  end
end
