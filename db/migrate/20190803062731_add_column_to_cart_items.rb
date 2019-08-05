class AddColumnToCartItems < ActiveRecord::Migration
  def change
    add_column :cart_items, :status, :string
  end
end
