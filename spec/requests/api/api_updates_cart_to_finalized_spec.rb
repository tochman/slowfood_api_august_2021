RSpec.describe 'PUT /api/carts/:id', type: :request do
  subject { response }
  let(:user) { create(:user) }
  let(:auth_headers) { user.create_new_auth_token }
  let(:product_1) { create(:product, name: 'Kangaroo Steak') }
  let(:product_2) { create(:product) }
  let(:cart) { create(:cart, user: user, products: [product_1, product_2]) }

  describe 'the request includes a valid cart id' do
    before do
      Timecop.freeze(Time.local(2008, 9, 1, 11, 30, 0))
      put "/api/carts/#{cart.id}",
          params: {
            finalized: true
          },
          headers: auth_headers
    end

    it { is_expected.to have_http_status 200 }

    it 'is expected to update cart#finalized to "true"' do
      cart.reload
      expect(cart.finalized?).to eq true
    end

    it 'is expected to include delivery time message' do
      expect(response_json['message']).to eq 'Your order is ready for pick-up at 12:00 PM'
    end
  end

  describe 'the request does NOT include a valid cart id' do
    before do
      Timecop.freeze(Time.local(2008, 9, 1, 11, 30, 0))
      put '/api/carts/999',
          params: {
            finalized: true
          },
          headers: auth_headers
    end

    it { is_expected.to have_http_status 422 }

    it 'is expected to include an error message' do
      expect(response_json['message']).to eq 'We could not process your request.'
    end
  end
end
