# == Schema Information
#
# Table name: recipes
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  servings   :integer
#  dish_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  menu_id    :integer
#

class Recipe < ApplicationRecord
end
