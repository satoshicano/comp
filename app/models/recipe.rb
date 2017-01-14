# == Schema Information
#
# Table name: recipes
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  servings   :integer
#  menu_id    :integer
#  dish_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Recipe < ApplicationRecord
  has_many :food_recipes
  has_many :food, through: :food_recipes
  has_many :food_step_recipes
  has_many :food_steps, through: :food_step_recipes
  belongs_to :dish
  belongs_to :menu
end
