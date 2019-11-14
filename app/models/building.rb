class Building < ApplicationRecord
  belongs_to :customer
  belongs_to :address
  has_many :interventions
  has_many :batteries

  def company_building
    "Building #{id} at #{address.street_number}"
  end
  


end
