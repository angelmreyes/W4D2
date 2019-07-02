# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  birth_day   :date             not null
#  color       :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  COLORS = %w(black white blue gray)

  validates :name, :birth_day, :description, presence: true
  validates :color, inclusion: { in: COLORS }, presence: true
    # message: "%{value} is not a valid color" 
  validates :sex, inclusion: { in: %w(M F) }, presence: true
    # message: "%{value} is not a valid sex" 

  def age 
    from_time = Time.now
    to_time = from_time - :birth_day
    distance_of_time_in_words(from_time, to_time)  
  end
end
