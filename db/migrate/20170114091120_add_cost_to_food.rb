class AddCostToFood < ActiveRecord::Migration[5.0]
  def change
    add_column :foods, :cost, :integer, after: :leather
  end
end
