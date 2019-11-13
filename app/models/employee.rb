class Employee < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :rememberable

  has_many :user
  has_many :interventions

  def employee_id
    "# #{self.id} #{self.name} #{self.lastname}"
  end
  


end
