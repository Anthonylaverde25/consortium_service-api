class Entity < ApplicationRecord
  belongs_to :consortium

  # Relación con la tabla intermedia
  has_many :entities_users

  # Relacion los departamentos
  has_many :entity_departments
  has_many :departments, through: :entity_departments

  # Acceso a usuarios a través de la tabla intermedia
  has_many :users, through: :entities_users

  # Relacion con un usuario determinado (gerente general)
  belongs_to :general_manager, class_name: "User", optional: true

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :description, length: { maximum: 255 }, allow_blank: true

  validate :ensure_single_general_manager


  private

  def ensure_single_general_manager
    # Verifica que el gerente general no esté asignado a otra entidad
    if general_manager.present? &&
       Entity.where(general_manager_id: general_manager.id)
             .where.not(id: id) # Excluir la entidad actual de la búsqueda
             .exists?
      errors.add(:general_manager, "ya es gerente general de otra entidad")
    end
  end
end
