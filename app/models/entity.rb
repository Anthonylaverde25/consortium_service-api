class Entity < ApplicationRecord
  belongs_to :consortium

  # Relación con la tabla intermedia
  has_many :entities_users

  # Acceso a usuarios a través de la tabla intermedia
  has_many :users, through: :entities_users

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :description, length: { maximum: 255 }, allow_blank: true
end
