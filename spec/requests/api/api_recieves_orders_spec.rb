RSpec.describe('GET api/carts') do
  describe 'successfully' do
    let!(:something) { create(:cart, name: 'Kangaroo Steak', unit_price: 500, quantity: 2, price: 1000) }

    before do
      get '/api/carts'
    end

    it 'is expected to return a 200 response status' do
      expect(response).to have_http_status 200
    end
  end
end
