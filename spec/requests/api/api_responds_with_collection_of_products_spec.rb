RSpec.describe 'GET api/products' do
  describe 'successfully' do
    let!(:starter) { create(:product, name: 'Shrimp', category: 'starter') }
    let!(:main_course) { create(:product, category: 'main_course') }
    let!(:dessert) { create(:product, category: 'dessert') }

    before do
      get '/api/products'
    end

    it 'is expected to return a 200 response status' do
      expect(response).to have_http_status 200
    end
    it 'is expected to return all products' do
      expect(response_json['products'].count).to eq 3
    end

    it 'is expected to return product names' do
      expect(response_json['products'].first['name']).to eq 'Shrimp'
    end

    it 'is expected to return a category name' do
      expect(response_json['products'].first['category']).to eq 'starter'
    end
  end
end
