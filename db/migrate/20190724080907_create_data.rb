class CreateData < ActiveRecord::Migration
  def change
    create_table :data do |t|
      t.string :product_model
      t.string :location
      t.string :Tax
      t.string :product_class
      t.integer :quantity
      t.integer :minimum_quantity
      t.integer :sort_order
      t.string :status

      t.timestamps null: false
    end
  end
end
