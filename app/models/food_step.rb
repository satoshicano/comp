# == Schema Information
#
# Table name: food_steps
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FoodStep < ApplicationRecord
  belongs_to :food
  belongs_to :step
  has_many :food_step_recipes
  has_many :recipes, through: :food_step_recipes
end
