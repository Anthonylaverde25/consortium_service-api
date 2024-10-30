class DepartmentsController < ApplicationController
  before_action :authenticate_user!  # Asegura que el usuario esté autenticado
end
