class CreateFoodStepRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :food_step_recipes do |t|
      t.integer :food_step_id
      t.integer :recipi_id

      t.timestamps
    end
  end
end
