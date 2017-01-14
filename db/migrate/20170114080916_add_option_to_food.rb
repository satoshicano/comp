class AddOptionToFood < ActiveRecord::Migration[5.0]
  def change
    add_column :foods, :option, :string, after: :step_id
    add_column :foods, :leather, :boolean, after: :option
  end
end
