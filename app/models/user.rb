class User < ApplicationRecord
  include RailsAdminCharts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :rememberable
        has_one :customer
        belongs_to :employee, optional: true
        def self.chart_type
          "column"
      end
end
