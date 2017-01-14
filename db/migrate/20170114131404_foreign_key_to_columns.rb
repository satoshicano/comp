class ForeignKeyToColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :food_recipes, :food_id, :integer
    add_column :food_recipes, :recipe_id, :integer
    add_foreign_key :food_recipes, :foods, column: :food_id
    add_foreign_key :food_recipes, :recipes, column: :recipe_id

    add_column :food_steps, :step_id, :integer
    add_column :food_steps, :food_id, :integer
    add_foreign_key :food_steps, :steps, column: :step_id
    add_foreign_key :food_steps, :foods, column: :food_id

    rename_column :food_step_recipes, :recipi_id, :recipe_id
    add_foreign_key :food_step_recipes, :food_steps, column: :food_step_id
    add_foreign_key :food_step_recipes, :recipes, column: :recipe_id

    add_foreign_key :recipes, :menus, column: :menu_id
    add_foreign_key :recipes, :dishes, column: :dish_id
  end
end
