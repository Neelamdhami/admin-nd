class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :description
      t.string :meta_tag_title
      t.string :meta_tag_description
      t.string :meta_tag_keywords

      t.timestamps null: false
    end
  end
end
