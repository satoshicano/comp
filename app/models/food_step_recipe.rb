# == Schema Information
#
# Table name: food_step_recipes
#
#  id            :integer          not null, primary key
#  recipi_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  food_steps_id :integer
#  recipes_id    :integer
#
# Indexes
#
#  index_food_step_recipes_on_food_steps_id  (food_steps_id)
#  index_food_step_recipes_on_recipes_id     (recipes_id)
#

class FoodStepRecipe < ApplicationRecord
  belongs_to :food_step
  belongs_to :recipe
end
