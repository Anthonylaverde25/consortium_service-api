# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_and_belongs_to_many :roles

  # El usuario puede tener muchas entradas en la tabla intermedia
  # Cada entrada en entities_users relaciona a un usuario con una entidad
  has_many :entities_users

  # Poder acceder a todas las entidades relacionadas con un usuario usando la tabla intermedia
  # through significa que no es necesario mirar directamente la tabla intermedia para acceder a su relacion
  # ejemplo: Juan.entities (acceso a las relaciones)
  has_many :entities, through: :entities_users


  has_one :managed_entities, class_name: "Entity", foreign_key: "general_manager_id"
end
