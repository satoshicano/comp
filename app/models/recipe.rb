# == Schema Information
#
# Table name: recipes
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  servings   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  menus_id   :integer
#  dishes_id  :integer
#
# Indexes
#
#  index_recipes_on_dishes_id  (dishes_id)
#  index_recipes_on_menus_id   (menus_id)
#

class Recipe < ApplicationRecord
  has_many :food_recipes
  has_many :food, through: :food_recipes
  has_many :food_step_recipes
  has_many :food_steps, through: :food_step_recipes
  belongs_to :dish
  belongs_to :menu
end
