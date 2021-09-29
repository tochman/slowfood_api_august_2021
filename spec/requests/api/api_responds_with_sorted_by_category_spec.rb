RSpec.describe 'GET api/products/:category' do
  describe 'successfully' do
    let!(:products) { 5.times { create(:product) } }
    before do
      get "/api/products/MyString"
    end

    it 'is expected to return a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return a certain number within a category' do
      expect(response_json['products'].count).to eq 5
    end

    it 'is expected to return a category name' do
      expect(response_json['products'].first['category']).to eq 'MyString'
    end
  end
end
