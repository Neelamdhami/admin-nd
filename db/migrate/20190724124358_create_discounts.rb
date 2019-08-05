class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.string :group
      t.integer :quantity
      t.integer :discount
      t.integer :date_start
      t.integer :date_end

      t.timestamps null: false
    end
  end
end
