RSpec.describe 'POST /api/carts', type: :request do
  describe 'as an authorized user' do
    let(:product) { create(:product, name: 'Pizza') }
    let(:user) { create(:user) }
    let(:auth_headers) { user.create_new_auth_token }

    subject { response }
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

    it 'is expected to include the product name' do
      expect(response_json['cart']['products'].first['name'])
        .to eq 'Pizza'
    end
  end
end
