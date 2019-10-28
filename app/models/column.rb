class Column < ApplicationRecord
  include RailsAdminCharts
  belongs_to :battery
  has_many :elevators

  def self.chart_type
    "column"
end

end
