class Building < ApplicationRecord
  belongs_to :customer
  belongs_to :address
  has_many :interventions, dependent: :restrict_with_exception
  has_many :batteries

  def company_building
    "Building #{id} at #{address.street_number}"
  end
  


end
