# == Schema Information
#
# Table name: food_steps
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  steps_id   :integer
#  foods_id   :integer
#
# Indexes
#
#  index_food_steps_on_foods_id  (foods_id)
#  index_food_steps_on_steps_id  (steps_id)
#

class FoodStep < ApplicationRecord
  belongs_to :food
  belongs_to :step
  has_many :food_step_recipes
  has_many :recipes, through: :food_step_recipes
end
