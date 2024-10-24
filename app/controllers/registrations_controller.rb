# app/controllers/registrations_controller.rb
class RegistrationsController < DeviseTokenAuth::RegistrationsController
  def create
    super do |user|
      if user.persisted?
        employed_role = Role.find_by(name: :employee)

        if employed_role
          user.roles << employed_role
          user.save
        else
          Rails.logger.error("No se encontró el rol 'employee'.")
        end
      end
    end
  end



  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :lastname)

    # Permitir los parámetros adicionales que necesitas
    # params.permit(:email, :password, :password_confirmation, :name, :lastname)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :lastname)

    # Permitir los parámetros adicionales para actualizar la cuenta
    # params.permit(:email, :password, :password_confirmation, :current_password, :name, :lastname)
  end
end
