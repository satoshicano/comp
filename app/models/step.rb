# == Schema Information
#
# Table name: steps
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  time       :float(24)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Step < ApplicationRecord
  has_many :food_steps
  has_many :steps, through: :food_steps
end
