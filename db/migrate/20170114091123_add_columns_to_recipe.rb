class AddColumnsToRecipe < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :menu_id, :integer
  end
end
