class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :rememberable, :validatable, :recoverable  
        
        has_one :customer
        has_one :intervention
        belongs_to :employee, optional: true
   
end
