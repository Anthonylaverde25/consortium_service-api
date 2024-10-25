class EntitiesUser < ApplicationRecord
  belongs_to :user
  belongs_to :entity

  # Validaciones opcionales
  validates :user_id, presence: true
  validates :entity_id, presence: true
end
