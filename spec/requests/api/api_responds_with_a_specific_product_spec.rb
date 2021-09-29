RSpec.describe 'GET /api/products/:id' do
  describe 'successfully' do
    let!(:product) { 
      create(:product, name: 'Whale Blubbers', price: 40, description: 'Delicious whale fat', image: 'stringURL') 
    }

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

    it 'is expected to return the description of the requested product' do
      expect(response_json['product']['description']).to eq "Delicious whale fat"
    end

    it 'is expected to return an image url for the requested product' do
      expect(response_json['product']['image']).to eq "stringURL"
    end
  end
end 