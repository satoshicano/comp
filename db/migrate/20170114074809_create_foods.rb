class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.float :calorie
      t.float :ash
      t.float :cholesterol
      t.float :protein
      t.float :water
      t.float :fiber
      t.float :fat
      t.float :carb
      t.integer :step_id

      t.timestamps
    end
  end
end
