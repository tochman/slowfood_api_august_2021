class AddColumnToCartProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :cart_products, :product_id, :integer
    add_column :cart_products, :cart_id, :integer
  end
end
