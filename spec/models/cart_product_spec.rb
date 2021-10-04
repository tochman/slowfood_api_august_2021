RSpec.describe CartProduct, type: :model do
  describe 'cart_product table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :product_id }
    it { is_expected.to have_db_column :cart_id }
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
  end
  describe 'associations' do
    it { is_expected.to belong_to :cart }
    it { is_expected.to belong_to :product }
  end

  describe 'Factory' do
    it 'is expected to be valid' do
      expect(create(:cart_product)).to be_valid
    end
  end  
end
