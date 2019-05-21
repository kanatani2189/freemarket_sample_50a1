class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.text :condition, null: false
      t.text :size
      t.text :shipping_burden, null: false
      t.text :shipping_method, null: false
      t.text :estimated_date, null: false
      t.integer :prefecture_id, null: false
      t.integer :brand_id, nnull: false
      t.timestamps
    end
  end
end
