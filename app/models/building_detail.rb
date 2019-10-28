class BuildingDetail < ApplicationRecord
  include RailsAdminCharts
  belongs_to :building
  
  def self.chart_type
    "column"
end

end
