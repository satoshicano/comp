# == Schema Information
#
# Table name: food_step_recipes
#
#  id           :integer          not null, primary key
#  food_step_id :integer
#  recipi_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class FoodStepRecipe < ApplicationRecord
  belongs_to :food_step
  belongs_to :recipe
end
