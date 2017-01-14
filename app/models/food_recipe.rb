# == Schema Information
#
# Table name: food_recipes
#
#  id         :integer          not null, primary key
#  number     :float(24)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FoodRecipe < ApplicationRecord
end
