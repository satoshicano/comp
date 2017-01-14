class AddDishidToRecipe < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :dish_id, :integer, after: :servings
  end
end
