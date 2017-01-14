class AddNumberToFoodRecipe < ActiveRecord::Migration[5.0]
  def change
    add_column :food_recipes, :number, :integer, after: :id
  end
end
