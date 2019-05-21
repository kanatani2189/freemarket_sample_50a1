class AddMidiumToParentCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :parent_categories, :midium, :text
  end
end
