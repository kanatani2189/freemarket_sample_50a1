class CreateLargeCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :large_categories do |t|
      t.text :category_name, null: false
      t.references :parent_category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
