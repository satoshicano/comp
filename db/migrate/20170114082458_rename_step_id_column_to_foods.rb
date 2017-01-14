class RenameStepIdColumnToFoods < ActiveRecord::Migration[5.0]
  def change
    rename_column :foods, :step_id, :recipe_id
  end
end
