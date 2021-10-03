require 'rails_helper'

RSpec.describe CartProduct, type: :model do
  describe 'cart_product table' do
    it { 'is_expected.to have_db_column :product_id' }
    it { 'is_expected.to have_db_column :cart_id' }
  end
  describe 'cart_product to contain a product' do
    it { is_expected.to belong_to :cart }
    it { is_expected.to belong_to :product }
  end
end
