class Intervention < ApplicationRecord
    belongs_to :customer, optional: false
    belongs_to :building, optional: false
    belongs_to :battery, optional: true
    belongs_to :column, optional: true
    belongs_to :elevator, optional: true
    belongs_to :employee, optional: true
end
