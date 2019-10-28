class Battery < ApplicationRecord
  include RailsAdminCharts
  belongs_to :building
  belongs_to :employee
  has_many :columns

  
  def self.chart_type
    "column"
end

end
