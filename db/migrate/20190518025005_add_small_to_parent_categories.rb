class AddSmallToParentCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :parent_categories, :small, :text
  end
end
