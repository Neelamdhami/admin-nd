class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.integer :pincode
      t.string :house_no
      t.string :city
      t.string :state
      t.integer :mobile_no
      

      t.timestamps null: false
    end
  end
end
