class CreateFoodRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :food_recipes do |t|

      t.timestamps
    end
  end
end
