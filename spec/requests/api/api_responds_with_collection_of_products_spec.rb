RSpec.describe 'GET api/products' do
  describe 'successfully' do
    let!(:products) { 5.times { create(:product)}}
    before do
      get '/api/products'
    end

    it 'is expected to return a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return all products' do
      expect(response_json['products'].count).to eq 5
    end

    it 'is expected to return product names' do
      expect(response_json['products'].first['name']).to eq 'MyString'
    end
  end
end
