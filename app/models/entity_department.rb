class EntityDepartment < ApplicationRecord
  belongs_to :entity
  belongs_to :department
end
