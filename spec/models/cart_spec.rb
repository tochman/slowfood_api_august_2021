RSpec.describe Cart, type: :model do
  describe 'cart table' do
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :user_id }
  end

  describe 'Factory' do
    it { is_expected.to belong_to(:user) }
  end
end
