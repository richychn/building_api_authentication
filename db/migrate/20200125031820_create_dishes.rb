class CreateDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :dishes do |t|
    	t.string :name
    	t.decimal :price, precision: 10, scale: 2
    	t.integer :menu_id

      t.timestamps
    end
  end
end
