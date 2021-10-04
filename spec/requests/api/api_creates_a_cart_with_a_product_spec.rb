RSpec.describe 'POST /api/carts', type: :request do
  subject { response }
  let(:product) { create(:product) }
  let(:user) { create(:user) }
  let(:auth_headers) { user.create_new_auth_token }
  describe 'authorized user can create an order' do
    before do
      post '/api/carts',
           params: {
             product_id: product.id
           },
           headers: auth_headers
    end

    it { is_expected.to have_http_status 201 }

    it 'is expected to return a message' do
      expect(response_json['message']).to eq(
        'This product was added to your cart!'
      )
    end

    it 'is expected to return a cart id' do
      expect(response_json['cart']['id']).to_not eq nil
    end

    it 'is expected to return an array of items' do
      expect(response_json['cart']['products'].count).to eq 1
    end
  end

  describe 'Unsuccesful request' do
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

    it { is_expected.to have_http_status 401 }

    it 'is expected to show error message when user is not authorized' do
      expect(response_json['errors']).to eq ['You need to sign in or sign up before continuing.']
    end
  end

  describe 'Unsuccesful request' do
    let(:product) { create(:product) }
    let(:user) { create(:user) }
    let(:auth_headers) { user.create_new_auth_token }

    before do
      post '/api/carts',
           params: {
             product_id: 1234
           },
           headers: auth_headers
    end

    it 'is expected to show error message with invalid product id' do
      expect(response_json['message']).to eq(
        'Something went wrong!'
      )
    end
  end
end
