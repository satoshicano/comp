class CreateFoodSteps < ActiveRecord::Migration[5.0]
  def change
    create_table :food_steps do |t|

      t.timestamps
    end
  end
end
