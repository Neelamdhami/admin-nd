class RenamedatatableColumn < ActiveRecord::Migration
  def change

  	rename_column :data , :class, :product_class
  	rename_column :data , :model, :product_model


  end
end
