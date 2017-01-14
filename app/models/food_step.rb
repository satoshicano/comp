# == Schema Information
#
# Table name: food_steps
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  step_id    :integer
#  food_id    :integer
#
# Indexes
#
#  fk_rails_618cded0ef  (food_id)
#  fk_rails_990a26558b  (step_id)
#

class FoodStep < ApplicationRecord
  belongs_to :food
  belongs_to :step
  has_many :food_step_recipes
  has_many :recipes, through: :food_step_recipes
end
