RSpec.describe('GET api/carts') do
  describe 'successfully' do
    let!(:carts) { create(:cart, name: 'Kangaroo Steak', unit_price: 500, quantity: 2, price: 1000, cart_id: 0001) }

    before do
      get '/api/carts/show'
    end
    
    it 'is expected to return a 200 response status' do
      expect(response).to have_http_status 200
      binding.pry
    end

    it 'is expected to return an item name' do
      expect(response_json['carts'].first['name']).to eq 'Kangaroo Steak'
    end

    it 'is expected to return a unit price' do
      expect(Cart.first['unit_price']).to eq 500
    end

    it 'is expected to return a quantity' do
      expect(Cart.first['quantity']).to eq 2
    end

    it 'is expected to return a overall price' do
      expect(Cart.first['price']).to eq 1000
    end
    it 'is expected to return a overall price' do
      expect(Cart.first['cart_id']).to eq 0001
    end
  end
end
