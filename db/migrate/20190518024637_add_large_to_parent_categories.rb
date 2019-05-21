class AddLargeToParentCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :parent_categories, :large, :text
  end
end
