RSpec.describe 'GET /api/products/:id' do
  describe 'successfully' do
    let!(:product) { create(:product, name: 'Whale Blubbers', price: 40) }

    before do
      get "/api/products/#{product.id}"
    end

    it 'is expected to return a 200 status' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return the requested products name' do
      expect(response_json['product']['name']).to eq 'Whale Blubbers'
    end

    it 'is expected to return the requested products price' do
      expect(response_json['product']['price']).to eq "40.0"
    end
  end
end 