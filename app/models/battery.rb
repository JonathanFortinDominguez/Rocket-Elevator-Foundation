class Battery < ApplicationRecord
  belongs_to :building
  belongs_to :employee
  has_many :columns
  has_many :interventions
  
  
  def battery_id
    "Battery # #{id}"
  end
  
  


end
