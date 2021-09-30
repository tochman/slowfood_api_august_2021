RSpec.describe 'GET api/products/:category' do
  describe 'successfully' do
    # let!(:products) { 5.times { create(:product) } }
    let!(:starter) { create(:product, name: 'Shrimps', category: 'starters')}
    let!(:main_course) { create(:product, category: 'main_courses')}
    let!(:dessert) { create(:product, category: 'desserts')}
    
    describe 'starters' do
      before do
        get "/api/products/", params: { category: 'starters'}
      end
      it 'is expected to return a 200 response status' do
        expect(response).to have_http_status 200
      end
  
      it 'is expected to return a certain number within a category' do
        expect(response_json['products'].count).to eq 1
      end
  
      it 'is expected to return a category name' do
        expect(response_json['products'].first['category']).to eq 'starters'
      end

      it 'is expected to return a product name' do
        expect(response_json['products'].first['name']).to eq 'Shrimps'
      end 
      
    end

    describe 'main_courses' do
      before do
        get "/api/products/", params: { category: 'main_courses'}
      end
      it 'is expected to return a 200 response status' do
        expect(response).to have_http_status 200
      end
  
      it 'is expected to return a certain number within a category' do
        expect(response_json['products'].count).to eq 1
      end
  
      it 'is expected to return a category name' do
        expect(response_json['products'].first['category']).to eq 'main_courses'
      end
      
    end
    
    describe 'desserts' do
      before do
        get "/api/products", params: { category: 'desserts'}
      end
      it 'is expected to return a 200 response status' do
        expect(response).to have_http_status 200
      end
  
      it 'is expected to return a certain number within a category' do
        expect(response_json['products'].count).to eq 1
      end
  
      it 'is expected to return a category name' do
        expect(response_json['products'].first['category']).to eq 'desserts'
      end     
    end
  end
end
