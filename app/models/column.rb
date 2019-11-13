class Column < ApplicationRecord
  belongs_to :battery
  has_many :elevators
  has_many :interventions

    
  def column_id
    "Column # #{id}"
  end

end
