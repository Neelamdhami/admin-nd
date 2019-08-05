class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image_preview
      t.string :image_url
      t.integer :sort_order

      t.timestamps null: false
    end
  end
end
