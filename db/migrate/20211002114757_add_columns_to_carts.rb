class AddColumnsToCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :cart_id, :integer

  end
end
