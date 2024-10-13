class Entity < ApplicationRecord
  belongs_to :consortium
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :description, length: { maximum: 255 }, allow_blank: true
end
