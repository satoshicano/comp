class AddReferencesToColumns < ActiveRecord::Migration[5.0]
  def change
    add_reference(:food_recipes, :food)
    add_reference(:food_recipes, :recipe)

    add_reference(:food_steps, :steps)
    add_reference(:food_steps, :foods)

    remove_column :food_step_recipes, :food_step_id
    add_reference(:food_step_recipes, :food_steps)
    add_reference(:food_step_recipes, :recipes)

    remove_column :recipes, :menu_id
    remove_column :recipes, :dish_id
    add_reference(:recipes, :menus)
    add_reference(:recipes, :dishes)
  end
end
