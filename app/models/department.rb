class Department < ApplicationRecord
  has_many :entity_departments
  has_many :entities, through: :entity_departments
end
