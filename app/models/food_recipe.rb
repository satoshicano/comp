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
#  index_food_recipes_on_food_id    (food_id)
#  index_food_recipes_on_recipe_id  (recipe_id)
#

class FoodRecipe < ApplicationRecord
  belongs_to :food
  belongs_to :recipe
end
