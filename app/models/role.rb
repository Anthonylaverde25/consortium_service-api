class Role < ApplicationRecord
  has_and_belongs_to_many :users

  ## Los nombres de los roles se estableceran con enum
  enum name: {
    super_admin: 0,
    admin: 1,
    employee: 2,
    general_manager: 3,
    plant_manager: 4
  }
end
