# == Schema Information
#
# Table name: food_recipes
#
#  id         :integer          not null, primary key
#  number     :float(24)
#  gram       :float(24)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  food_id    :integer
#  recipe_id  :integer
#
# Indexes
#
#  fk_rails_0c50f858e8  (food_id)
#  fk_rails_abcc6c92c3  (recipe_id)
#

class FoodRecipe < ApplicationRecord
  belongs_to :food
  belongs_to :recipe
end
