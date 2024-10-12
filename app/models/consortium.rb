class Consortium < ApplicationRecord
  self.table_name = "consortiums"
  acts_as_paranoid ## soft_deleted

  has_many :entities
  has_many_attached :images
  enum status: { pending: 0, active: 1, inactive: 2 }

  # Validaciones propias del modelo
  validates :name, :description, :email, :phone_number, :legal_representative, :status, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
