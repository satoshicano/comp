# == Schema Information
#
# Table name: foods
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  calorie     :float(24)
#  ash         :float(24)
#  cholesterol :float(24)
#  protein     :float(24)
#  water       :float(24)
#  fiber       :float(24)
#  fat         :float(24)
#  carb        :float(24)
#  step_id     :integer
#  option      :string(255)
#  leather     :boolean
#  cost        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Food < ApplicationRecord
end
