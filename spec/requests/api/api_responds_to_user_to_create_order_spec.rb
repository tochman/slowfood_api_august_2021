RSpec.describe'POST /api/carts', type: :request do
  describe 'authorized loggedin user can view cart and create order' do
    let!(:product) { create(:product, name: "Insects", price: 1800)}
    let!(:user) { create(:user)}
    
    before do
      post "/api/auth/sign_in",
      params: {
        email: user.email,
        password: user.password,
      }
      post '/api/carts/create'
    end
    
    it 'is expected to return a 204 response status' do
      binding.pry
      expect(response).to have_http_status 204
    end
  end
end