class AddGramToFoodRecipe < ActiveRecord::Migration[5.0]
  def change
    add_column :food_recipes, :gram, :float, after: :number
  end
end
