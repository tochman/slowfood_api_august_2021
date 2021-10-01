RSpec.describe('GET api/carts') do
  describe 'successfully' do
    
    let!(:carts) { create(:cart, name: 'Kangaroo Steak', unit_price: 500, quantity: 2, price: 1000) }

    before do
      get '/api/carts/show'
    end

    it 'is expected to return a 204 response status' do
      expect(response).to have_http_status 204
    end

    it 'is expected to return an item name' do
      # binding.pry
      expect(Cart.first['name']).to eq "Kangaroo Steak"
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
  end
end
