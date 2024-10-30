
class ConsortiumsController < ApplicationController
  before_action :authenticate_user!  # Asegura que el usuario esté autenticado
  before_action :set_consortium, only: [ :show, :update, :destroy ]


  def index
    use_case = ConsortiumUsecase::FindAllConsortium.new
    @consortiums = use_case.call
    render json: @consortiums

  rescue StandardError => e
    Rails.logger.error("Error retrieving all consortiums: #{e.message}")
    render json: { error: "Internal Server Error" }, status: :internal_server_error
  end

  def show
     render json: Presenter::ConsortiumPresenter.as_json(@consortium)
    # render json: @consortium
  end

  def create
    use_case = ConsortiumUsecase::CreateConsortium.new

    begin
      saved_consortium = use_case.call(consortium_params)

      render json: saved_consortium, status: :created
    rescue StandardError => e
      Rails.logger.error("Error creating consortium: #{e.message}")
      render json: { errors: consortium_entity.errors }, status: :unprocessable_entity
    end
  end



  def update
    use_case = ConsortiumUsecase::UpdateConsortium.new
    begin
      update_consortium = use_case.call(@consortium, consortium_params)
      render json: Presenter::ConsortiumPresenter.as_json(update_consortium), status: :ok
    rescue StandardError => e
      Rails.logger.error("Error updating consortium: #{e.message}")
      render json: { errors: consortium_entity.errors }, status: :unprocessable_entity
    end
  end


  def destroy
    use_case = ConsortiumUsecase::DeleteConsortium.new



    begin
      use_case.call(@consortium)
      head :no_content
    rescue
      Rails.logger.error("Error deleting consortium: #{e.message}")
      render json: { error: "Error deleting consortium" }, status: :unprocessable_entity
    end
  end


  private

  def set_consortium
    use_case = ConsortiumUsecase::FindConsortium.new
    @consortium = use_case.call(params[:id])
    # @consortium = ConsortiumEntity.new(consortium_data)
    ## Al crear una instacia de entidad, deja de ser un object de tipo activeRecord
    ## por lo cual no se puede acceder a sus metodos, ejemplo, c.update
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Consortium not found" }, status: :not_found
  rescue StandardError => e
    Rails.logger.error("Error finding consortium desde el set: #{e.message}")
  end




  def consortium_params
    params.require(:consortium).permit(:id, :name, :description, :email, :phone_number,
      :legal_representative, :status, :registration_number, :country,
      :state_province, :city, :address, :postal_code, :website,
      :organization_type, :images, :deleted_at)
  end
end
