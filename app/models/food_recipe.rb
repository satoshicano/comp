# == Schema Information
#
# Table name: food_recipes
#
#  id         :integer          not null, primary key
#  number     :float(24)
#  gram       :float(24)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FoodRecipe < ApplicationRecord
  belongs_to :food
  belongs_to :recipe
end
