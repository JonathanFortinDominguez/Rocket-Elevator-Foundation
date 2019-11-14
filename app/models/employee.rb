class Employee < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :authors, class_name: "Intervention", foreign_key: "author_id"
  has_many :employees, class_name: "Intervention", foreign_key: "employee_id"
  has_many :user

  def employee_info
    "##{self.id} #{self.lastname}"
  end
  
  def name
    "##{self.id} #{self.lastname}"
  end

end
