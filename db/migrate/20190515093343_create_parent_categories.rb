class CreateParentCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :parent_categories do |t|
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
