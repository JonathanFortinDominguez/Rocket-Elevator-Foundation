class Customer < ApplicationRecord
  include RailsAdminCharts
  belongs_to :address
  belongs_to :user

  has_many :buildings

  
  def self.chart_type
    "column"
end
end
