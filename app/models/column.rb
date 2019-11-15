class Column < ApplicationRecord
  belongs_to :battery
  has_many :elevators
  has_many :interventions

    
  def column_info
    "Column ##{id}"
  end

end
