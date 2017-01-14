# == Schema Information
#
# Table name: food_step_recipes
#
#  id           :integer          not null, primary key
#  food_step_id :integer
#  recipe_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  fk_rails_461a73235a  (food_step_id)
#  fk_rails_cc9d162585  (recipe_id)
#

class FoodStepRecipe < ApplicationRecord
  belongs_to :food_step
  belongs_to :recipe
end
