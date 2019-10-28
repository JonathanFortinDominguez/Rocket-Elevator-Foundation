class User < ApplicationRecord
  include RailsAdminCharts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :rememberable

        has_one :customer
   
        def self.chart_type
          "column"
      end
end
