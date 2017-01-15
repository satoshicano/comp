class AddOrderToColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :food_steps, :order, :integer
  end
end
