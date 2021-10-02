RSpec.describe Cart, type: :model do
  describe 'cart table' do
    it {is_expected.to have_db_column :name}
    it {is_expected.to have_db_column :unit_price}
    it {is_expected.to have_db_column :quantity}
    it {is_expected.to have_db_column :price}
  end
  describe 'Factory' do
    it 'is expected to have valid Factory' do
      expect(create(:cart)).to be_valid
    end
  end
end
