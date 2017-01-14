class RemoveAndAddColumnToRecipe < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipes, :menu_id

    add_column :recipes, :menu_id, :integer, after: :servings
  end
end
