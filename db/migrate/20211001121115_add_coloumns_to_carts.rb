class AddColoumnsToCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :unit_price, :decimal
    add_column :carts, :quantity, :integer
    add_column :carts, :price, :decimal
  end
end
